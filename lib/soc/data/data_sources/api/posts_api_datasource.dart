import 'dart:convert';

import 'package:testquest/soc/data/rest/api/models/post_api_model.dart';
import 'package:testquest/soc/data/rest/api/post_api_service.dart';

class PostsApiDataSource {
  PostApiService service;

  PostsApiDataSource() {
    service = PostApiService.create();
  }

  Future<List<PostApiModel>> getPosts() async {
    final response = await service.getPosts();
    return PostList.fromJson(response.body as List<dynamic>).posts;
  }
}
