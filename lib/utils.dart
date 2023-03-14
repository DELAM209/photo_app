import 'dart:io';
import 'package:flutter/services.dart';

class Utils {
  static sharePhoto(String photoId) {
    if (Platform.isAndroid) {
      try {
        const platform = MethodChannel('com.photoapp.dev/share');
        platform.invokeMethod('shareMedia', {"link": photoId});
      } on PlatformException catch (e) {
        print("Platform error: ${e.message}");
      }
    }
  }
}
