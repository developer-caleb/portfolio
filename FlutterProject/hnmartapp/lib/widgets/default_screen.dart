import 'package:flutter/material.dart';
import 'package:hanaromart/widgets/buttons/back_button1.dart';
import 'package:hanaromart/widgets/buttons/hamburger_button.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({
    required this.titleString,
    this.backButton = true,
    this.hamburgerButton = true,
    required this.body,
    this.action,
    this.floatingActionButton,
    Key? key,
  }) : super(key: key);
  final String titleString;
  final bool backButton;
  final bool hamburgerButton;
  final Widget body;
  final List<Widget>? action;
  final Widget? floatingActionButton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      appBar: AppBar(
        leadingWidth: 80,
        title: Text(titleString),
        leading: backButton ? BackButton1() : SizedBox.shrink(),
        actions: [
          ...?action,
          hamburgerButton ? HamburgerButton() : SizedBox.shrink(),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            color: Color(0xFF3B3B3A),
          ),
        ),
      ),
      body: body,
    );
  }
}
