import 'package:flutter/material.dart';

import '../flyer_screen.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: SingleChildScrollView(
        child: Column(
          // padding: EdgeInsets.zero,
          children: [
            MenuNavTop(context),
            PageLink("행사전단", FlyerScreen(), context),
          ],
        ),
      ),
    );
  }
}

Widget MenuNavTop(context) {
  return Container(
    child: Row(children: [Text("Menu"), CloseButton(context)]),
  );
}

Widget CloseButton(context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Text("close"),
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
