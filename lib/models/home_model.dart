import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final homeModelProvider = Provider<HomeModel>((ref) {
  return HomeModel("Welcome Home!", DateFormat("dd MMMM, yyyy").format(DateTime.now()), "Get Amazing stuff!",
      "https://images.pexels.com/photos/1125212/pexels-photo-1125212.jpeg");
});

class HomeModel {
  String title;
  String date;
  String btnText;
  String backgroundUrl;

  HomeModel(this.title, this.date, this.btnText, this.backgroundUrl);
}
