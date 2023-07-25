import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hanaromart/widgets/default_screen.dart';

class ReceiptImage extends StatelessWidget {
  const ReceiptImage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
        titleString: '전자영수증',
        body: Container(
          margin: EdgeInsets.only(left: 12, right: 12, top: 30, bottom: 78),
          decoration: BoxDecoration(
            border: Border.all(width: 0.50, color: Color(0xFF3C3C3B)),
            borderRadius: BorderRadius.circular(10),
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: new CachedNetworkImageProvider(
                  'https://picsum.photos/300/500'),
            ),
          ),
        ));
  }
}
