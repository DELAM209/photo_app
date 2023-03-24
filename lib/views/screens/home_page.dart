import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_app/models/home_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeModel = ref.watch(homeModelProvider);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: Image.network(homeModel.backgroundUrl).image, fit: BoxFit.cover)),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 50, right: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  homeModel.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: const Color.fromARGB(250, 20, 36, 41), fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  homeModel.date,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: const Color.fromARGB(250, 20, 36, 41), fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 420,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RawMaterialButton(
                      shape: const StadiumBorder(),
                      fillColor: const Color.fromARGB(255, 80, 80, 120),
                      onPressed: () => navigateToDashboard(context),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          homeModel.btnText,
                          style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  navigateToDashboard(BuildContext context) {
    context.go('/dashboard');
  }
}
