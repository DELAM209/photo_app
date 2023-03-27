import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/models/photo_resource.dart';
import 'package:http/http.dart' as http;

final photoServiceApi = Provider((ref) => ServiceApi());

class ServiceApi {
  getItemsPerCategory(String category) async {
    Map<String, String> queryParams = {"query": category, "per_page": "10"};
    var url = Uri.https('api.pexels.com', 'v1/search', queryParams);
    Map<String, String> headers = {
      "Authorization":
          "api_key"
    };
    var response = await http.get(headers: headers, url);
    Map<String, dynamic> map = jsonDecode(response.body);
    return (map["photos"] as List).map((data) => PhotoResource.fromJson(data)).toList();
  }
}
