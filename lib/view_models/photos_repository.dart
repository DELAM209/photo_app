import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/repository/service_api.dart';
import '../models/photo_resource.dart';

final repositoryProvider = StateNotifierProvider<PhotosRepository, List<PhotoResource>>((ref) {
  return PhotosRepository();
});

class PhotosRepository extends StateNotifier<List<PhotoResource>> {
  final _api = GetIt.instance.get<ServiceApi>();

  PhotosRepository() : super(List.empty(growable: true)) {
    fetchPhotosBy("nature");
  }

  void fetchPhotosBy(String query) async {
    state = await _api.getItemsPerCategory(query);
  }
}

final categoryProvider = Provider<List<String>>((ref) => ["Nature", "Animals", "Countryside", "Dessert", "Food"]);
