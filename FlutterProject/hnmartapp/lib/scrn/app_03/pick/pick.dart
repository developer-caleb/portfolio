import 'package:flutter/material.dart';

class Pick extends StatelessWidget {
  const Pick({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('pick page'),
            ],
          ),
        ),
      ),
    );
  }
}
