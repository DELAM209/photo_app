
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/repository/service_api.dart';

import '../models/photo_resource.dart';

class DashboardViewModel extends ChangeNotifier {
  final _api = GetIt.instance.get<ServiceApi>();
  List<PhotoResource> _photos = List.empty(growable: true);
  List<String> _categories = [
    "Nature",
    "Animals",
    "Countryside",
    "Dessert",
    "Food"
  ];

  // Public getters
  List<PhotoResource> get photos => _photos;
  List<String> get categories => _categories;

  void loadPhotosBy(String query) async {
    _photos = await _api.getItemsPerCategory(query);
    notifyListeners();
  }

  String getCategoryName(int index) {
    return _categories[index];
  }

  photoLiked(int photoId) {
    final photo = _photos.firstWhere((element) => element.id == photoId);
    photo.liked = !photo.liked;
    notifyListeners();
  }
}
