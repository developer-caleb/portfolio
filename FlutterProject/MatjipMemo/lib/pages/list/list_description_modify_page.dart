import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matjipmemo/constants/app_colors.dart';
import 'package:matjipmemo/constants/firestore_keys.dart';
import 'package:matjipmemo/models/firebase/matjip_model.dart';
import 'package:matjipmemo/tools/logger.dart';
import 'package:matjipmemo/tools/show_toast.dart';

class ListDescriptionModifyPage extends StatefulWidget {
  const ListDescriptionModifyPage({super.key, required this.matjipModel});
  final MatjipModel matjipModel;

  @override
  State<ListDescriptionModifyPage> createState() => _ListDescriptionModifyPageState();
}

class _ListDescriptionModifyPageState extends State<ListDescriptionModifyPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentsController = TextEditingController();
  final int maxTextLength = 1000;

  @override
  void initState() {
    _titleController.text = widget.matjipModel.matjipName;
    _contentsController.text = widget.matjipModel.description ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('장소 수정'),
        actions: [
          TextButton(
              onPressed: () {
                if (_titleController.text.trim().isEmpty) {
                  return showToast('장소를 입력해주세요.'.tr);
                }
                if (_contentsController.text.trim().isEmpty) {
                  return showToast('내용을 입력해주세요.'.tr);
                }
                //통신
                MatjipModel newMatjipModel = widget.matjipModel;

                ///Lists/6QjrTlqRqFn09kAWAnxy/Matjips/rgDwDHtXuEyHPkbYAyG0 reference가 담겨 있긴 함!,
                logger.d('matjip reference -> ${newMatjipModel.reference?.path}');
                newMatjipModel.matjipName = _titleController.text.trim();
                newMatjipModel.description = _contentsController.text.trim();
                newMatjipModel.reference?.update({KEY_MATJIPNAME: newMatjipModel.matjipName, KEY_DESCRIPTION: newMatjipModel.description});
                Get.back(result: newMatjipModel);
              },
              child: Text(
                '수정',
                style: TextStyle(color: AppColors.mainAccentColor, fontWeight: FontWeight.w700),
              ))
        ],
        bottom: PreferredSize(
            child: Container(
              color: AppColors.mainColor,
              height: 2,
            ),
            preferredSize: const Size.fromHeight(1)),
      ),
      body: ListView(
        children: [
          Expanded(
              child: TextField(
                  controller: _titleController,
                  // obscureText: false, //패스워드일경우 **표시
                  maxLength: 30,
                  decoration: InputDecoration(
                      hintText: '장소(30자)'.tr, counterText: "", hintStyle: const TextStyle(color: Colors.black26), border: InputBorder.none, fillColor: Colors.transparent, filled: true))),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
          TextField(
              controller: _contentsController,
              minLines: 15,
              maxLines: 500,
              maxLength: maxTextLength,
              onChanged: (str) {
                setState(() {});
              },
              keyboardType: TextInputType.multiline,
              decoration:
                  InputDecoration(counterText: "", hintText: '내용'.tr, hintStyle: const TextStyle(color: Colors.black26), border: InputBorder.none, fillColor: Colors.transparent, filled: true)),
        ],
      ),
    );
  }
}
