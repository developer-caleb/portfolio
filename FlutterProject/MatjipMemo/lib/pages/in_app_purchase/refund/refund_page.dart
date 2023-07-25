import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matjipmemo/constants/app_colors.dart';
import 'package:matjipmemo/constants/app_styles.dart';
import 'package:matjipmemo/constants/firestore_keys.dart';
import 'package:matjipmemo/controller/login_controller.dart';
import 'package:matjipmemo/data/repo/image_network_repository.dart';
import 'package:matjipmemo/models/firebase/user_model.dart';
import 'package:matjipmemo/route/get_parameters.dart';
import 'package:matjipmemo/route/router_name.dart';
import 'package:matjipmemo/tools/logger.dart';
import 'package:matjipmemo/tools/show_toast.dart';
import 'package:matjipmemo/view/widget/crop_images.dart';
import 'package:matjipmemo/view/widget/pop_ups.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/repo/inquire_network_repository.dart';

class RefundPage extends StatefulWidget {
  const RefundPage({super.key});

  @override
  State<RefundPage> createState() => _RefundPageState();
}

class _RefundPageState extends State<RefundPage> {
  bool checkPersonalInfo = false;
  bool checkIosReceipt = false;
  String keyAndroid = 'Android';
  String keyIos = 'iOS';
  List<String> dropdownList = [];
  String selectedDropdown = 'Android';
  TextEditingController emailTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  TextEditingController androidReceiptNumberTextController = TextEditingController();
  TextEditingController iosAccountHolderController = TextEditingController();
  TextEditingController iosBankNameController = TextEditingController();
  TextEditingController iosAccountNumberController = TextEditingController();
  File? imageFile;
  bool isProgressing = false;

  @override
  void initState() {
    super.initState();
    dropdownList.add(keyAndroid);
    dropdownList.add(keyIos);
  }

  @override
  void dispose() {
    emailTextController.dispose();
    descriptionTextController.dispose();
    androidReceiptNumberTextController.dispose();
    iosAccountHolderController.dispose();
    iosBankNameController.dispose();
    iosAccountNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('결제 및 환불 문의'),
        actions: [TextButton(onPressed: () => onSubmit(), child: Text('제출'))],
        bottom: PreferredSize(
            child: Container(
              color: AppColors.mainColor,
              height: 2,
            ),
            preferredSize: const Size.fromHeight(1)),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: [
              ..._inquire(),
              ..._agreePersonalInfo(),
              ..._image(),
              ..._email(),
              ..._description(),
              ..._checkOS(),
              ...selectedDropdown == dropdownList[0] ? _androidWidgetList() : _iosWidgetList(),
              SizedBox(height: 100),
            ],
          ),
          Visibility(
            visible: isProgressing,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _image() {
    return [
      Text(
        '스크린샷',
        style: AppStyles.refundTitleTextStyle,
      ),
      SizedBox(height: 15),
      InkWell(
        onTap: () {
          //Image Change
          onClickImageChange();
        },
        child: imageFile == null
            ? AspectRatio(
                aspectRatio: 2 / 1,
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                    Icons.image,
                    size: 30,
                  ),
                ),
              )
            : Image.file(
                imageFile!,
                fit: BoxFit.fill,
              ),
      ),
      SizedBox(height: 30)
    ];
  }

  List<Widget> _androidWidgetList() {
    return [
      Text(
        'Android 영수증 번호',
        style: AppStyles.refundTitleTextStyle,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: TextField(
          controller: androidReceiptNumberTextController,
          style: AppStyles.refundDropdownTextStyle,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      Text(
        'Android를 사용하실 경우 Google Play 스토어에 연동 된 계정의 이메일로 발송된 계정 영수증'
        ' 내부의 코드 번호를 입력해주세요(코드 번호 예시 : GP. 1234 - 1234 - 1234 - 12345)',
        style: AppStyles.smallDescription,
      ),
    ];
  }

  List<Widget> _iosWidgetList() {
    return [
      Text(
        '예금주',
        style: AppStyles.refundTitleTextStyle,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: TextField(controller: iosAccountHolderController, style: AppStyles.refundDropdownTextStyle, decoration: AppStyles.refundInputDecoration),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        '은행명',
        style: AppStyles.refundTitleTextStyle,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: TextField(controller: iosBankNameController, style: AppStyles.refundDropdownTextStyle, decoration: AppStyles.refundInputDecoration),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        '계좌번호',
        style: AppStyles.refundTitleTextStyle,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: TextField(controller: iosAccountNumberController, style: AppStyles.refundDropdownTextStyle, decoration: AppStyles.refundInputDecoration),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        transform: Matrix4.translationValues(-15, 0, 0.0),
        child: InkWell(
          onTap: () {
            setState(() {
              checkIosReceipt = !checkIosReceipt;
            });
          },
          child: Row(
            children: [
              Checkbox(
                  fillColor: MaterialStateProperty.all(AppColors.mainColor),
                  value: checkIosReceipt,
                  onChanged: (value) {
                    setState(() {
                      checkIosReceipt = value ?? false;
                    });
                  }),
              Text(
                'IOS 영수증',
                style: AppStyles.refundTitleTextStyle.copyWith(fontSize: 15),
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 32),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
            text: 'App 결제 내역 페이지\n',
            style: AppStyles.smallDescription,
          ),
          TextSpan(
              text: 'https://reportaproblem.apple.com',
              style: AppStyles.smallDescription.copyWith(color: AppColors.mainColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  const url = 'https://reportaproblem.apple.com';
                  if (!await launchUrl(
                    Uri.parse(url),
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw 'Could not launch $url';
                  }
                }),
          TextSpan(
            text: '에서 날짜 및 시간이 포함된 영수증을 첨부해 주세요.',
            style: AppStyles.smallDescription,
          ),
        ])),
      ),
      SizedBox(
        height: 30,
      ),
    ];
  }

  List<Widget> _inquire() {
    return [
      Text(
        '문의 내용',
        style: AppStyles.refundTitleTextStyle,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '결제 및 환불 관련 문의',
          style: AppStyles.refundDropdownTextStyle,
        ),
      ),
      SizedBox(
        height: 15,
      ),
    ];
  }

  List<Widget> _checkOS() {
    return [
      Text(
        'OS',
        style: AppStyles.refundTitleTextStyle,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey[500]!),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton(
          borderRadius: BorderRadius.circular(12),
          isExpanded: true,
          style: AppStyles.refundDropdownTextStyle.copyWith(color: Colors.black87),
          underline: SizedBox.shrink(),
          value: selectedDropdown,
          // style: AppStyles.refundDropdownTextStyle,
          items: dropdownList.map((String item) {
            return DropdownMenuItem<String>(
              child: Text(item),
              value: item,
            );
          }).toList(),
          onChanged: (String? value) {
            if (value == keyAndroid) {
              iosAccountHolderController.text = '';
              iosBankNameController.text = '';
              iosAccountNumberController.text = '';
            } else {
              androidReceiptNumberTextController.text = '';
            }
            setState(() {
              selectedDropdown = value!;
            });
          },
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ];
  }

  List<Widget> _agreePersonalInfo() {
    return [
      Container(
        transform: Matrix4.translationValues(-15, 0, 0.0),
        child: InkWell(
          onTap: () {
            setState(() {
              checkPersonalInfo = !checkPersonalInfo;
            });
          },
          child: Row(
            children: [
              Checkbox(
                  fillColor: MaterialStateProperty.all(AppColors.mainColor),
                  value: checkPersonalInfo,
                  onChanged: (value) {
                    setState(() {
                      checkPersonalInfo = value ?? false;
                    });
                  }),
              Text(
                '개인정보 수집 및 이용에 동의합니다.',
                style: AppStyles.refundTitleTextStyle.copyWith(fontSize: 15),
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 32),
        child: Text(
          '잇트립은 고객상담 업무를 처리하기 위해 최소한의 개인 정보만을 수집하고 있습니다. ① 개인정보 수집항목:'
          '이름, 이메일 주소 ② 수집목적: 고객식별, 문의응대, 서비스 품질 향상 ③ 보유 및 이용기간: '
          '수집 목적이 달성되면 지체없이 모든 개인정보를 파기합니다. 단, 관계법령에서 일정 기간 정보의 보관을 규정한'
          ' 경우에 한해 분리 보관 후 파기합니다.',
          style: AppStyles.smallDescription,
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ];
  }

  List<Widget> _email() {
    return [
      Text(
        '이메일 주소',
        style: AppStyles.refundTitleTextStyle,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: TextField(controller: emailTextController, style: AppStyles.refundDropdownTextStyle, decoration: AppStyles.refundInputDecoration),
      ),
      SizedBox(
        height: 30,
      ),
    ];
  }

  List<Widget> _description() {
    return [
      Text(
        '설명',
        style: AppStyles.refundTitleTextStyle,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: TextField(
          style: AppStyles.refundDropdownTextStyle,
          minLines: 3,
          maxLines: 6,
          controller: descriptionTextController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 30,
      )
    ];
  }

  Future uploadingRefundInquire(String text) async {
    showProgressTextDialog('업로드 중입니다.\n');

    UserModel? thisUser = Get.find<LoginController>().userModel;
    if (thisUser == null) {
      throw ('this user is null');
    }
    //이미지 업로드를 먼저 수행한다.
    DocumentReference inquireRef = FirebaseFirestore.instance.collection(COLLECTION_INQUIRES).doc(thisUser.uid).collection(COLLECTION_CHATS).doc();
    String? imageUrl = await imageNetworkRepository.uploadImage(imageFile!, postKey: thisUser.uid, path: 'Users/${thisUser.uid}/inquire/${inquireRef.id}/${basename(imageFile!.path)}');
    if (imageUrl?.isEmpty ?? true) {
      showToast('이미지 업로드에 실패하였습니다.');
      logger.e('이미지 업로드에 실패하였습니다.');
      return;
    }
    await inquireNetworkRepository.sendNewMessage(loginUser: thisUser, text: text, docUid: thisUser.uid, isMaster: false, imageList: [imageUrl!], docRef: inquireRef);
    Get.until((route) => route is! PopupRoute); //팝업창 모두 끄기
    Get.offNamed(Routes.InquireDetail, parameters: {GetParameters.userId: thisUser.uid});
  }

  void onSubmit() async {
    if (isProgressing) {
      return;
    }
    if (!checkPersonalInfo) {
      showToast('개인정보 수집 여부를 확인해주세요');
      return;
    }
    if (imageFile == null) {
      showToast('스크린샷을 업로드 해주세요');
      return;
    }
    if (!GetUtils.isEmail(emailTextController.text)) {
      showToast('이메일 주소 확인해주세요');
      return;
    }
    if (descriptionTextController.text.trim().isEmpty) {
      showToast('설명을 작성해주세요');
      return;
    }
    if (selectedDropdown == keyAndroid && androidReceiptNumberTextController.text.trim().isEmpty) {
      showToast('안드로이드 정보를 작성해주세요');
      return;
    }
    if (selectedDropdown == keyIos && (iosAccountNumberController.text.trim().isEmpty || iosBankNameController.text.trim().isEmpty || iosAccountHolderController.text.trim().isEmpty)) {
      showToast('iOS 정보를 작성해주세요');
      return;
    }
    if (selectedDropdown == keyIos && !checkIosReceipt) {
      showToast('iOS 영수증을 체크하고 사진을 업로드해주세요');
      return;
    }

    ///제출을 모두 확인하고 upload 를 완료한 후 다음 페이지로 넘어간다.
    try {
      String text = '결제 및 환불 관련 문의\n';
      text += '이메일 주소 : ${emailTextController.text}\n';
      text += '${descriptionTextController.text}\n';
      text += 'OS : $selectedDropdown\n';
      if (selectedDropdown == keyAndroid) {
        //android
        text += '영수증 번호 : ${androidReceiptNumberTextController.text}';
      } else {
        //ios
        text += 'iOS 계좌정보 : \n';
        text += '예금주 : ${iosAccountHolderController.text}\n';
        text += '은행명 : ${iosBankNameController.text}\n';
        text += '계좌번호 : ${iosAccountNumberController.text}';
      }
      await uploadingRefundInquire(text);
      Get.until((route) => route is! PopupRoute); //팝업창 모두 끄기
    } catch (e) {
      logger.e('error occur $e');
      showToast('오류가 발생하였습니다');
      Get.until((route) => route is! PopupRoute); //팝업창 모두
    }

    return;
  }

  void onClickImageChange() async {
    try {
      logger.d("프로필 변경");
      final _picker = ImagePicker();
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      imageFile = await cropImage(
        pickedFile.path,
      );
      if (imageFile == null) return;
      setState(() {});

      // setState(() {
      //   isProgressing = true;
      // });
      //var controller = Get.find<LoginController>();
      // String? imgUrl = await imageNetworkRepository.uploadImage(croppedFile, postKey: controller.userModel!.uid, path: "Users/${controller.userModel!.uid}/refund/${basename(croppedFile.path)}");
      // await userNetworkRepository.updateAllPostsProfileImage(controller.userModel!.uid, imgUrl!);
      // setState(() {
      //   isProgressing = false;
      // });
    } catch (e) {
      setState(() {
        isProgressing = false;
      });
    }
  }
}
