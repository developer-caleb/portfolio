import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/tools/logger.dart';
import 'package:hanaromart/widgets/buttons/back_button1.dart';
import 'package:hanaromart/widgets/buttons/hamburger_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen(
      {required this.title,
      super.key,
      required this.urlAddress,
      this.backButton = true,
      this.hamburgerButton = true,
      this.canGoBack = true});
  final String title;
  final String urlAddress;
  final bool backButton;
  final bool hamburgerButton;
  final bool canGoBack;
  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  double progress = 0;
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            logger.d('progress : $progress');
            setState(() {
              this.progress = progress / 100;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    controller.loadRequest(Uri.parse(widget.urlAddress));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.backButton || widget.canGoBack) {
          if (await controller.canGoBack()) {
            controller.goBack();
            return false;
          } else {
            return true;
          }
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
            leadingWidth: 70,
            leading: widget.backButton
                ? BackButton1(
                    onTap: () async {
                      if (!widget.canGoBack) {
                        return Get.back();
                      }
                      if (await controller.canGoBack()) {
                        controller.goBack();
                      } else {
                        Get.back();
                      }
                    },
                  )
                : widget.canGoBack
                    ? futureBackButton()
                    : null,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(
                height: 1,
                color: Color(0xFF3B3B3A),
              ),
            ),
            actions: [if (widget.hamburgerButton) HamburgerButton()],
            title: Text(widget.title)),
        body: Column(
          children: [
            Visibility(
                visible: progress < 1.0,
                child: LinearProgressIndicator(
                  value: progress,
                  color: Color(0xFF16B368),
                  backgroundColor: Color(0xFF16B368).withOpacity(0.4),
                )),
            Expanded(child: WebViewWidget(controller: controller)),
          ],
        ),
      ),
    );
  }

  FutureBuilder<bool> futureBackButton() {
    return FutureBuilder(
      future: controller.canGoBack(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.data ?? false) {
          return BackButton1(
            onTap: () {
              controller.goBack();
            },
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
