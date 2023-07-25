import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:locationdiary/utils/permissions.dart';
import 'package:locationdiary/app/auth/auth_controller.dart';
import 'package:locationdiary/app/profile/profile_controller.dart';
import 'package:locationdiary/utils/logger.dart';
import 'package:locationdiary/data/dto/model/user_model.dart';
import 'package:locationdiary/utils/app_colors.dart';
import 'package:locationdiary/utils/app_text_styles.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({this.isEdit = false, Key? key}) : super(key: key);
  bool isEdit;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FocusNode _profileTextFieldFocusNode = FocusNode();
  final TextEditingController textEditingController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  String get profileNicknameString => textEditingController.text.trim();
  UserModel? userModel;
  final profileController = Get.put<ProfileController>(ProfileController());

  @override
  void initState() {
    if (widget.isEdit) {
      userModel = Get.find<AuthController>().userModel;
      if (userModel != null) {
        textEditingController.text = userModel!.userNickname ?? '';
      }
    }
    super.initState();
    Future.microtask(() => _profileTextFieldFocusNode.requestFocus());
    if (userModel?.userProfileImgUrl?.isNotEmpty ?? false) {
      getSavedProfileImage();
    }
  }

  void getSavedProfileImage() async {
    profileController.setProgressing(true);
    File? file = await profileController.getImage(
      fileName: userModel!.userProfileImgUrl!,
      directory: 'profile',
    );
    profileController.setProfileImgFile(file);
    profileController.setProgressing(false);
  }

  @override
  void dispose() {
    _profileTextFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      return IgnorePointer(
        ignoring: profileController.isProgressing,
        child: WillPopScope(
          onWillPop: () => Future.value(!profileController.isProgressing),
          child: Scaffold(
            appBar: widget.isEdit
                ? AppBar(
                    title: const Text('프로필 수정하기'),
                  )
                : null,
            body: SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            SizedBox(
                              height: !widget.isEdit ? 44 : 30,
                            ),
                            if (!widget.isEdit)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _welcomeTextWidget(),
                                ],
                              ),
                            const SizedBox(
                              height: 40,
                            ),
                            //이미지 박스
                            _profileImageWidget(),
                            const SizedBox(
                              height: 21.5,
                            ),
                            _nicknameTextField(),
                          ],
                        ),
                      ),
                      _confirmButton(),
                    ],
                  ),
                  Visibility(
                    visible: profileController.isProgressing,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _confirmButton() {
    return GetBuilder<ProfileController>(
      builder: (profileController) {
        return InkWell(
          onTap: profileNicknameString.isEmpty
              ? null
              : () => profileController.onSubmitted(
                    text: profileNicknameString,
                    isEdit: widget.isEdit,
                  ),
          child: Container(
            height: 60,
            color: profileNicknameString.isEmpty
                ? AppColors.lightGray02
                : AppColors.darkGray01,
            child: Center(
              child: Text(
                '설정 완료',
                style: AppTextStyles.button1.copyWith(
                    color: profileNicknameString.isEmpty
                        ? AppColors.gray03
                        : AppColors.systemWhite),
              ),
            ),
          ),
        );
      },
    );
  }

  String get makeUid => DateTime.now().millisecondsSinceEpoch.toString();

  Padding _nicknameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        /*autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? val) {
                return '올바른 휴대폰 번호를 입력해주세요';
              },*/

        ///추후 적용
        controller: textEditingController,
        focusNode: _profileTextFieldFocusNode,
        maxLength: 10,
        keyboardType: TextInputType.name,
        onChanged: (input) {
          setState(() {});
        },
        decoration: InputDecoration(
          suffixIcon: profileNicknameString.isEmpty
              ? null
              : Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        textEditingController.text = "";
                      });
                    },
                    child: const ImageIcon(
                      AssetImage(
                        "assets/icons/cross_icon.png",
                      ),
                      color: Color(0xff8e8e93),
                      size: 17,
                    ),
                  ),
                ),
          suffixIconConstraints: const BoxConstraints(
            minHeight: 17,
            minWidth: 17,
            maxHeight: 17,
          ),
          hintText: '닉네임을 10글자 이내로 작성해주세요',
          counterText: "",
          hintStyle: AppTextStyles.body2.copyWith(color: AppColors.gray01),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.systemBlack10),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.systemBlack10),
          ),
          contentPadding: const EdgeInsets.fromLTRB(0, 15, 16, 15),
        ),
      ),
    );
  }

  void selectImage({required ImageSource imageSource}) async {
    final profileController = Get.put<ProfileController>(ProfileController());
    bool permissioncheck = await checkImagePermission();
    if (!permissioncheck) {
      return logger.e('이미지 허가 되지 않음');
    }
    // Pick an image
    var preImageFile = await _picker.pickImage(source: imageSource);
    // 이미지 File 내부 저장,
    profileController.setProgressing(true);
    File? imageFile = preImageFile != null ? File(preImageFile.path) : null;
    if (imageFile == null) {
      profileController.setProgressing(false);
      return;
    }
    setState(() {
      profileController.setProfileImgFile(imageFile);
    });
    profileController.setProgressing(false);
  }

  Widget _profileImageWidget() {
    const double profileSize = 80;

    return Center(
      child: SizedBox(
        width: profileSize,
        height: profileSize,
        child: GetBuilder<ProfileController>(builder: (profileController) {
          if (profileController.isProgressing) return SizedBox();
          logger.d('이미지 url : ${userModel?.userProfileImgUrl!}');
          return profileController.profileImgFile != null
              ? GestureDetector(
                  child: SizedBox(
                      width: profileSize,
                      height: profileSize,
                      child: ClipOval(
                        child: Image.file(
                          profileController.profileImgFile!,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      )),
                  onTap: () {
                    showCupertinoModalPopup(
                      context: Get.context!,
                      builder: (context) => CupertinoActionSheet(
                        message: const Text('프로필 설정'),
                        actions: <CupertinoActionSheetAction>[
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Get.back();
                              selectImage(imageSource: ImageSource.gallery);
                            },
                            child: const Text('앨범에서 사진 선택'),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Get.back();
                              profileController.setProfileImgFile(null);
                              logger.d(
                                  '프로필 이미지 파일 출력: ${profileController.profileImgFile}');
                            },
                            child: const Text('기본 이미지로 변경'),
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          isDefaultAction: true,
                          child: const Text('취소'),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                    );
                  })
              : GestureDetector(
                  onTap: () {
                    selectImage(imageSource: ImageSource.gallery);
                  },
                  child: defaultProfileWidget(),
                );
        }),
      ),
    );
  }

  Stack defaultProfileWidget() {
    return Stack(
      children: [
        Image.asset(
          'assets/icons/profile_default.png',
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            'assets/icons/icon_add_image.png',
            width: 24,
            height: 24,
          ),
        ),
      ],
    );
  }

  Padding _welcomeTextWidget() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        '안녕하세요.\n프로필을 설정해 주세요.',
        style: AppTextStyles.heading1,
      ),
    );
  }
}

//Deprecated 220722 utils/permissions 참조
/*
Future<bool> _getImagePermission({required ImageSource imageSource}) async {
  logger.d('이미지 허가');
  Permission permission;
  switch (imageSource) {
    case ImageSource.camera:
      permission = Permission.camera;
      break;
    case ImageSource.gallery:
      permission = Permission.photos;
      break;
  }

  PermissionStatus previousPermissionStatus = await permission.status;
  PermissionStatus permissionStatus = await permission.request();
  logger.d('permissionStatus:$permissionStatus');
  if (permissionStatus.isPermanentlyDenied || permissionStatus.isDenied) {
    bool? isOpenSettings = await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return CupertinoAlertDialog(
          title: const Text("이미지 서비스 사용"),
          content: const Text(AppStrings.preventImageUseString),
          actions: [
            CupertinoDialogAction(
                child: const Text("취소"),
                onPressed: () {
                  Get.back(result: false);
                }),
            CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text("설정으로 이동"),
                onPressed: () {
                  Get.back(result: true);
                })
          ],
        );
      },
    );
    if (isOpenSettings == true) {
      bool isGranted = await PermissionManager()
          .checkAndRequestPermission(permission, appSetting: true);
      if (isGranted == true) {
        return true;
      }
    }
  } else if (permissionStatus.isGranted || permissionStatus.isLimited) {
    if (previousPermissionStatus.isPermanentlyDenied ||
        previousPermissionStatus.isDenied) {
      await Future.delayed(const Duration(seconds: 1));
    }
    return true;
  }
  return false;
}*/
