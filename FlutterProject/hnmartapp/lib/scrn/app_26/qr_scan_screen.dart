import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hanaromart/tools/logger.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rxdart/rxdart.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({Key? key}) : super(key: key);

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isProcessing = false;
  StreamSubscription? listener;

  @override
  void initState() {
    super.initState();
    //testQrRead();
  }

  @override
  void reassemble() {
    super.reassemble();
    logger.d('reassemble');
    /*  if (Platform.isAndroid) {
      controller!.pauseCamera();
    }*/
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    logger.d('onBuild');
    double scanArea = min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.7;
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR코드 스캔'),
      ),
      body: Stack(children: [
        _buildQrView(context),
        /*  Center(
          child: Text(
            'QR코드 카메라 스캔',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        )*/
        /*   Center(
            child: Container(
                // constraints: BoxConstraints(),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration:
                    BoxDecoration(color: Colors.black.withOpacity(0.7), borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'QR코드 카메라 스캔',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                )))*/
      ]),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    double scanArea = min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.7;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Color(0xFF03A64A),
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
        //overlayColor: Color(0x11000000)
        //overlayColor: Color(0xCC000000),
      ),
      // onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      //퍼미션 한꺼번에 8번 물어봄,
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    ///또는 FutureBuilder로 또는 GetX의 다른 routing으로, build 되기 전에
    logger.d('log: _onQRViewCreated');

    this.controller = controller;
    Stream<Barcode> stream = controller.scannedDataStream;
    stream.debounceTime(const Duration(milliseconds: 3000));
    listener = stream.listen((Barcode scanData) async {
      readBarcode(scanData, controller);
    });
  }

  void readBarcode(Barcode scanData, QRViewController controller) async {
    try {
      logger.d('ScanTime : ${DateTime.now()}');
      if (isProcessing) {
        return logger.i('is processing');
      }
      isProcessing = true;
      controller.pauseCamera();
      logger.d('_onDataList ${scanData.code}');
      Uri scanDataUri = Uri.parse(scanData.code!);
      logger.d('scanData.origin -> ${scanDataUri.origin}');
      /*   if (scanDataUri.origin == 'origin') {
        logger.d('scanData.path -> ${scanDataUri.path}');
        //TODO : api 통신할 것
        isProcessing = false;
      }*/
      Get.dialog(completeDialog(), barrierDismissible: false, barrierColor: Colors.transparent);
      await Future.delayed(Duration(milliseconds: 2000));

      Get.until((route) => route is! PopupRoute); //팝업창 모두 끄기
      isProcessing = false;
      controller.resumeCamera();
    } catch (e) {
      logger.e('error is occur $e');
      Get.dialog(failDialog(), barrierDismissible: false, barrierColor: Colors.transparent);
      await Future.delayed(Duration(milliseconds: 2000));
      Get.until((route) => route is! PopupRoute); //팝업창 모두 끄기
      isProcessing = false;
      controller.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    listener?.cancel();
    super.dispose();
  }

  Dialog completeDialog() {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
          padding: EdgeInsets.only(top: 16, bottom: 20, left: 60, right: 60),
          decoration:
              BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(width: 1)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/app_26/ic_complete.svg',
                width: 53,
                height: 50,
              ),
              Text(
                '응모완료',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.53,
                ),
              )
            ],
          )),
    );
  }

  Dialog failDialog() {
    logger.e('failDialog');
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
          padding: EdgeInsets.only(top: 12, bottom: 14, left: 30, right: 30),
          decoration:
              BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(width: 1)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/app_26/ic_failure.svg',
                width: 45,
                height: 45,
              ),
              Text(
                '이미 사용 됐거나\n잘못된 QR입니다',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.53,
                ),
              )
            ],
          )),
    );
  }
}
