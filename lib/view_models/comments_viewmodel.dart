import 'package:get_it/get_it.dart';
import 'package:photo_app/models/photo_comment.dart';
import 'package:photo_app/repository/comments_api.dart';

class CommentsViewModel {
  final _api = GetIt.instance.get<CommentsApi>();
  List<PhotoComment> comments = List.empty(growable: true);

  Future<List<PhotoComment>> commentsFuture(int photoId) async {
    return _api.getCommentsForMedia(photoId);
  }
}
