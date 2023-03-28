import 'dart:io';
import 'package:flutter/services.dart';

class Utils {
  static sharePhoto(String id) {
    if (Platform.isAndroid) {
      try {
        MethodChannel platform = const MethodChannel("com.photoapp.dev/share");
        platform.invokeMethod('shareMedia', {"link": "https://photo.app/photoDetail/$id"});
      } on PlatformException catch (e) {
        print("Platform error: ${e.message}");
      }
    }
  }
}
