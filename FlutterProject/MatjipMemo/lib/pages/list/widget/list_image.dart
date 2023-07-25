import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matjipmemo/view/widget/matjip_item/text_image.dart';

import '../../../models/firebase/list_model.dart';

class ListImage extends StatelessWidget {
  const ListImage({
    required this.listModel,
    super.key,
  });

  final ListModel listModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 1,
        child: listModel.thumbUrl?.isNotEmpty ?? (false)
            ? CachedNetworkImage(fit: BoxFit.fill, placeholder: (context, url) => const Center(child: CircularProgressIndicator()), imageUrl: listModel.thumbUrl!)
            : const IconImage(
                CupertinoIcons.camera,
                iconColor: Colors.black26,
              ),
      ),
    );
  }
}
