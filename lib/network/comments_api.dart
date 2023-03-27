import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:photo_app/models/photo_comment.dart';

final commentsApiProvider = Provider((ref) => CommentsApi());

class CommentsApi {
  Future<List<PhotoComment>> getCommentsForMedia(int id) async {
    Map<String, String> queryParams = {"limit": "10", "select": "body,postId,username"};
    var url = Uri.https('dummyjson.com', 'comments', queryParams);
    var response = await http.get(url);
    Map<String, dynamic> map = jsonDecode(response.body);
    return (map["comments"] as List).map((data) => PhotoComment.fromJson(data)).toList();
  }
}
