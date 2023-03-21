import 'dart:io';
import 'package:flutter/services.dart';

class Utils {
  static sharePhoto(String url) {
    if (Platform.isAndroid) {
      try {
        const platform = MethodChannel('com.photoapp.dev/share');
        platform.invokeMethod('shareMedia', {"link": url});
      } on PlatformException catch (e) {
        print("Platform error: ${e.message}");
      }
    }
  }
}
