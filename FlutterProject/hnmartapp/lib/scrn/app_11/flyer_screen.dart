import 'package:flutter/material.dart';
import 'package:hanaromart/widgets/default_screen.dart';

import 'flyer_list.dart';
import 'no_leaflet_screen.dart';

class FlyerScreen extends StatelessWidget {
  const FlyerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      titleString: '행사전단',
      body: true ? FlyerList() : NoLeafletScreen(),
      floatingActionButton: true ? _floatingActionButton() : null,
    );
  }

  Align _floatingActionButton() {
    return Align(
      alignment: Alignment(1, 0.90),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Color(0xFF21AB8A),
              Color(0xFF37D099),
            ])),
        child: TextButton(
          style: TextButton.styleFrom(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('온라인몰 이동'),
              Image.asset(
                'assets/app_11/ic_nh_mark.png',
                width: 25,
                height: 26,
              )
            ],
          ),
        ),
      ),
    );
  } // build()
}

/*
*
* Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Color(0xFF21AB8A),
                      Color(0xFF37D099),
                    ])),
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('온라인몰 이동'),
                      Image.asset(
                        'assets/app_11/ic_nh_mark.png',
                        width: 25,
                        height: 26,
                      )
                    ],
                  ),
                ),
              )*/
