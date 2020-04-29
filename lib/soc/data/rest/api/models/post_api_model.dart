import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:testquest/soc/data/db/posts_database.dart';

part 'post_api_model.g.dart';

@JsonSerializable()
class PostApiModel {
  int userId;
  int id;
  String title;
  String body;
  PostApiModel(this.userId, this.id, this.title, this.body);
  factory PostApiModel.fromJson(dynamic json) { // solution because of issue with list decode
    return PostApiModel(
         json['userId'] as int,
         json['id'] as int,
         json['title'] as String,
         json['body'] as String);
  }
//  factory PostApiModel.fromJson(Map<String, dynamic> json) => _$PostApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostApiModelToJson(this);
}

class PostList {
  final List<PostApiModel> posts;
  PostList({
    this.posts,
  });

  factory PostList.fromJson(List<dynamic> parsedJson) {

    List<PostApiModel> posts = new List<PostApiModel>();
    posts = parsedJson.map((i) => PostApiModel.fromJson(i)).toList();

    return new PostList(
      posts: posts,
    );
  }
}

extension ToDataModel on PostApiModel {
  Post toDataModel() {
    return Post(
      id: this.id,
      userId: this.userId,
      title: this.title,
      body: this.body
    );
  }
}