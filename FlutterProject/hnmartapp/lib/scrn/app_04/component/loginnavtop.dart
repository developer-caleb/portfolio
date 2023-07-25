import 'package:flutter/material.dart';

class LoginNavTop extends StatelessWidget {
  final BuildContext context;

  LoginNavTop(this.context);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 1.2,
              ),
            ),
          ),
        )
      ],
    );
  }
}
