import 'package:url_launcher/url_launcher.dart';

import 'logger.dart';

class UrlLauncherTools {
  myLaunch(String url) async {
    try {
      if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
    } catch (e) {
      logger.e(e);
    }
  }

  htmlLaunch(String url) async {
    if (url.startsWith('https://') || url.startsWith('http://')) {
      logger.d('go to -> $url');
      return myLaunch(url);
    }
    String newUrl = url;
    if (url.startsWith('www')) {
      newUrl = 'http://' + url;
    } else {
      newUrl = 'http://' + url;
    }
    logger.d('go to -> $newUrl');
    myLaunch(newUrl);
  }
}
