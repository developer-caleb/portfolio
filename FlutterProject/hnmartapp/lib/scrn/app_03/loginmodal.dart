import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/widgets/custom_text.dart';

class LoginModal extends StatelessWidget {
  const LoginModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: Color(0x99000000),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50), top: Radius.circular(50)),
        ),
        height: 150,
        child: Column(
          // padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 40,
            ),
            CustomText(size: 18, text: '서비스 이용을 위해 로그인이 필요합니다.', color: Colors.white),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CancelButton(context),
                  SizedBox(
                    width: 60,
                  ),
                  LoginButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget CancelButton(context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20), top: Radius.circular(20)),
        color: Color(0x55FF0000),
      ),
      width: 100,
      height: 30,
      child: CustomText(text: '취소', size: 16, color: Colors.red),
    ),
  );
}

Widget LoginButton(context) {
  return InkWell(
    onTap: () {
      Get.toNamed(Routes.LOGIN);
    },
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30), top: Radius.circular(30)),
        color: Color(0x9900FF00),
      ),
      width: 100,
      height: 30,
      child: CustomText(text: '로그인', size: 16, color: Colors.white),
    ),
  );
}

Widget NavTop(context) {
  return Container(
    child: Row(children: [Text('Menu'), CloseButton(context)]),
  );
}

Widget CloseButton(context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Text('close'),
  );
}

Widget PageLink(title, page, context) {
  return Center(
    child: InkWell(
      child: Text(title),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    ),
  );
}
