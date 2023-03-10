import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/repository/service_api.dart';
import 'package:photo_app/views/screens/home_page.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<ServiceApi>(ServiceApi());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Hide status bar
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color(0xFF1C1532),
        ),
      ),
      home: HomePage(),
    );
  }
}
