import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String textlabel;
  final String conjunction;
  final ValueChanged<String>? onChanged;

  const CustomTextInput(this.textlabel, {super.key, this.conjunction = '을/를', this.onChanged});

  @override
  Widget build(BuildContext context) {
    final hintSupportText = ' 입력해주세요.';
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.zero,
      ),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: textlabel,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          hintText: '$textlabel$conjunction$hintSupportText',
          hintStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.0),
            borderRadius: BorderRadius.zero,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 24.0, right: 24.0, top: 22.0, bottom: 22.0),
        ),
      ),
    );
  }
}
