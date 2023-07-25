import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/config/app_colors.dart';
import 'package:hanaromart/config/app_style.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/services/auth_service.dart';
import 'package:hanaromart/tools/toast.dart';
import 'package:hanaromart/widgets/buttons/back_button1.dart';
import 'package:hanaromart/widgets/custom_text.dart';
import 'package:hanaromart/widgets/dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idTextController = TextEditingController();
  TextEditingController pwTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: 70,
        leading: BackButton1(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            color: Color(0xFF3B3B3A),
          ),
        ),
      ),
      backgroundColor: Color(0xFFF9FBF7),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //LoginNavTop(context),
          Spacer(
            flex: 1,
          ),
          SizedBox(
            height: 30,
          ),
          buildPhoneLoginButton(),

          SizedBox(height: 15),
          CustomText(text: '휴대폰 본인인증을 통한 간편 로그인'),
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
                controller: idTextController,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  labelText: '아이디',
                  filled: true,
                  fillColor: Colors.white,
                  border: AppStyle.completeInputBorder, //normal border
                  enabledBorder: AppStyle.normalInputBorder, //enabled border
                  focusedBorder: AppStyle.completeInputBorder, //focused border
                  // set more border style like disabledBorder
                )),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                controller: pwTextController,
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  filled: true,
                  fillColor: Colors.white,
                  border: AppStyle.completeInputBorder, //normal border
                  enabledBorder: AppStyle.normalInputBorder, //enabled border
                  focusedBorder: AppStyle.completeInputBorder, //focused border
                  // set more border style like disabledBorder
                )),
          ),
          /* CustomTextInput('아이디', conjunction: '를'),
          CustomTextInput('비밀번호', conjunction: '를'),*/
          SizedBox(
            height: 16,
          ),
          CustomText(text: '통합회원가입 ID/PW를 입력하세요.'),
          SizedBox(height: 10),
          SizedBox(
            width: 150,
            child: TextButton(
                onPressed: () {
                  if (idTextController.text.isNotEmpty && pwTextController.text.isNotEmpty) {
                    Get.find<AuthService>().temporaryLogin();
                    Get.back();
                  } else {
                    blackDialog(
                        text: '통합회원이 아니시거나\n입력한 정보가 일치하지 않습니다', greenText: '확인', onClickGreenText: () => Get.back());
                  }
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(width: 2, color: Color(0xFF0B0C10))),
                    backgroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    foregroundColor: Color(0xFF080707)),
                child: Text('ID 로그인')),
          ),
          /* CustomButton(
              onPressed: () {},
              text: 'ID 로그인',
              height: 40,
              font_color: Colors.black,
              margin: 240,
              font_size: 20,
              border_width: 2,
              font_weight: FontWeight.bold),*/
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    showToast('준비 중인 기능이에요🥲');
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: AppColors.black,
                      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  child: Text('아이디 찾기')),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.FIND_PASSWORD);
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: AppColors.black,
                      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  child: Text('비밀번호 찾기')),
              /*    CustomTextButton(
                text: '아이디 찾기',
                size: 20,
                weight: FontWeight.bold,
                onPressed: () {},
              ),
              CustomTextButton(
                text: '비밀번호 변경',
                size: 20,
                weight: FontWeight.bold,
                onPressed: () {},
              ),*/
            ],
          ),
          Spacer(
            flex: 10,
          ),
          buildIntegratedEnrollButton(),
          /*  CustomButton(
            onPressed: () {},
            text: '통합회원가입',
            height: 70,
            margin: 10,
            font_color: Color(0xFF125C38),
            font_weight: FontWeight.bold,
            font_size: 28,
            border_radius: BorderRadius.all(Radius.zero),
            boxshadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 4),
              ),
            ],
          ),*/
          Spacer(),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  SizedBox buildPhoneLoginButton() {
    return SizedBox(
      width: 250,
      child: TextButton(
          onPressed: () {
            Get.toNamed('${Routes.BLANK}?text=휴대폰 로그인');
          },
          style: AppStyle.phoneLoginButtonStyle,
          child: Text('휴대폰 로그인')),
    );
  }

  Padding buildIntegratedEnrollButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () {
          showToast('준비 중인 기능이에요🥲');
        },
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Color(0xFF7E7A97)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              '통합회원가입',
              style: TextStyle(fontSize: 25, color: Color(0xFF125C38), fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget CustomButton({
//     text,
//     margin,
//     background_color,
//     font_size,
//     font_color,
//     font_weight,
//     border_color,
//     border_width,
//     border_radius,
//     height,
//     boxShadow,
//     onpressed,
//     objective,
//     flag,
//     params
//   }) {
//   return Container(
//     width: double.infinity,
//     height: height??50.0,
//     margin:EdgeInsets.only(left:margin??40.0, right: margin??40.0),
//     decoration: BoxDecoration(
//       color: background_color??Colors.white,
//       border: Border.all(color: border_color??Colors.black, width: border_width??1.0),
//       borderRadius: border_radius??BorderRadius.circular(30),
//       boxShadow: boxShadow??[BoxShadow()],
//     ),
//     child: Center(
//       child:
//         CustomText(text:text, size:font_size, color:font_color, weight:font_weight)
//     ),
//   );
// }

// Widget CustomTextButton(text,{size, weight,onpressed}) {
//   return TextButton(
//     onPressed: onpressed??(){},
//     child: CustomText(text:text, size:size, weight:weight),
//   );
// }

// Widget CustomTextInput(textlabel, {conjunction, onchanged}) {
//   final hintSupportText = ' 입력해주세요.';
//   return Container(
//     margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 15, bottom: 10),
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.black, width: 1),
//       borderRadius: BorderRadius.zero,
//     ),
//     child: TextFormField(
//       decoration: InputDecoration(
//         labelText: textlabel,
//         labelStyle: TextStyle(
//           fontSize: 24.0,
//           fontWeight: FontWeight.bold,
//         ),
//         hintText: textlabel+conjunction??''+hintSupportText,
//         hintStyle: TextStyle(
//           fontSize: 24.0,
//           fontWeight: FontWeight.bold,
//         ),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black, width: 0.0),
//           borderRadius: BorderRadius.zero,
//         ),
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: EdgeInsets.all(30.0),
//       ),
//     ),
//   );
// }

// Widget CustomText({text, size, color, weight}) {
//   Color color_final = color ?? Colors.black;
//   double size_final = size ?? 22;
//   FontWeight weight_final = weight ?? FontWeight.w500;
//   return Text(
//     text,
//     textAlign: TextAlign.center,
//     style: TextStyle(
//     fontSize: size_final,
//     color: color_final,
//     fontWeight: weight_final
// ),
//   );
// }

// Widget NavTopLogin(context) {
//   return Column(
//     children: [
//       Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//         ),
//         margin:EdgeInsets.only(left:20.0),
//         height: 98,
//         child:Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     child: Row(
//                       children: [
//                         CustomText(text:'< 이전', size: 26, weight:FontWeight.bold),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//       Container(
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: Colors.black,
//               width: 1.2,
//             ),
//           ),
//         ),
//       )
//     ],
//   );
// }
