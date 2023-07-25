import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

import 'logger.dart';

Future<List<Asset>?> loadAssets(int length, int maxImageLength) async {
  await Permission.storage.request().isGranted;
  await Permission.manageExternalStorage.request().isGranted;
  try {
    return await MultiImagePicker.pickImages(
      maxImages: maxImageLength - length,
      enableCamera: true, //오류나서 끔
      //selectedAssets: multipickImages,
      cupertinoOptions: CupertinoOptions(
        takePhotoIcon: "chat",
        doneButtonTitle: "완료".tr,
      ),
      materialOptions: MaterialOptions(
        statusBarColor: "#FF5F4D",
        actionBarColor: "#FF5F4D",
        actionBarTitle: "사진 가져오기".tr,
        allViewTitle: "All Photos",
        useDetailsView: false,
        selectCircleStrokeColor: "#000000",
      ),
    );
  } on Exception catch (e) {
    logger.e(e);
    return null;
  }

  // If the widget was removed from the tree while the asynchronous platform
  // message was in flight, we want to discard the reply rather than calling
  // setState to update our non-existent appearance.
}

Future<File> getResizeImage(File originalImage, {int? size, required bool thumb}) async {
/*  Image image = decodeImage(originalImage.readAsBytesSync())!;
  int width  = image.width;
  int height = image.height;
  double ratio = width/height;
  Image? resizedImage;
  if(ratio>1) resizedImage =  copyResize(image, width: min(width, standard), height: min(width.toDouble()/ratio, standard.toDouble()/ratio).toInt());
  else resizedImage =  copyResize(image, width: min(width*ratio, standard*ratio).toInt(), height: min(height, standard).toInt());*/
  File? newFile = await FlutterImageCompress.compressAndGetFile(
      originalImage.absolute.path, originalImage.parent.path + 'thumb_' + basename(originalImage.path) + '.jpg',
      quality: 30, minHeight: size??300, minWidth: size??300);
  return newFile!;
}
