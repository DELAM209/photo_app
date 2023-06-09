import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_app/views/screens/dashboard_page.dart';
import 'package:photo_app/views/screens/home_page.dart';
import 'package:photo_app/views/widgets/photo_view_detail.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Hide status bar
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color(0xFF1C1532),
        ),
      ),
      routerConfig: _goRouter,
    );
  }

  final _goRouter = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
        routes: [
          GoRoute(
            path: 'dashboard',
            builder: (context, state) => DashboardPage(),
          ),
          GoRoute(
            name: "photoDetail",
            path: 'photoDetail/:photoId',
            builder: (context, state) => PhotoViewDetail(title: state.params['photoId']!),
          ),
        ],
      ),
    ],
  );
}
