import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:photo_app/views/screens/dashboard_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.network(
                    "https://images.pexels.com/photos/1125212/pexels-photo-1125212.jpeg")
                    .image,
                fit: BoxFit.cover)),
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
                  "Welcome Home Miguel!",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Color.fromARGB(250, 20, 36, 41),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  DateFormat("dd MMMM, yyyy").format(now),
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Color.fromARGB(250, 20, 36, 41),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 420,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RawMaterialButton(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          " Get Amazing stuff!",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ),
                      shape: StadiumBorder(),
                      fillColor: Color.fromARGB(255, 80, 80, 120),
                      onPressed: () => navigateToDashboard(context)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  navigateToDashboard(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DashboardScreen()));
  }
}
