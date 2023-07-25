import 'package:flutter/material.dart';

class Point extends StatelessWidget {
  const Point({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('point page'),
            ],
          ),
        ),
      ),
    );
  }
}

