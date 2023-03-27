import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/photo_resource.dart';
import '../network/service_api.dart';

final categoryProvider = Provider<List<String>>((ref) => ["Nature", "Animals", "Countryside", "Dessert", "Food"]);
final repositoryProvider = StateNotifierProvider<PhotosRepository, List<PhotoResource>>((ref) {
  return PhotosRepository(ref);
});

class PhotosRepository extends StateNotifier<List<PhotoResource>> {
  final Ref _ref;
  late final ServiceApi _photoServiceApi;

  PhotosRepository(this._ref) : super(List.empty(growable: true)) {
    _photoServiceApi = _ref.read(photoServiceApi);
    String defaultCategory = _ref.read(categoryProvider).first;
    fetchPhotosBy(defaultCategory);
  }

  void fetchPhotosBy(String query) async {
    state = await _photoServiceApi.getItemsPerCategory(query);
  }

  void photoLiked(photoId) {
    List<PhotoResource> photos = [...state];
    final photoIndex = photos.indexWhere((element) => element.id == photoId);
    photos[photoIndex].liked = !photos[photoIndex].liked;
    state = photos;
  }
}
