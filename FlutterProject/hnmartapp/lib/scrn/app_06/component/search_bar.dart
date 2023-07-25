import 'package:flutter/material.dart';
import 'package:hanaromart/scrn/app_06/app06_controller.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.controller});

  final App06Controller controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(left: 12.0, right: 12),
      child: TextFormField(
        controller: controller.textEditingController,
        keyboardType: TextInputType.text,
        onFieldSubmitted: (value) {
          controller.searchText(value);
          FocusManager.instance.primaryFocus?.unfocus();
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
            hintText: controller.hintText.value,
            hintStyle: TextStyle(color: Colors.grey[400]),
            contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {
                controller.searchText(controller.textEditingController.text);
                FocusManager.instance.primaryFocus?.unfocus();
              },
            )),
      ),
    );
  }
}
