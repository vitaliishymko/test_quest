import 'dart:async';

import 'package:testquest/soc/data/data_sources/api/posts_api_datasource.dart';
import 'package:testquest/soc/data/data_sources/local/posts_local_data_source.dart';
import 'package:testquest/soc/data/db/posts_database.dart';
import 'package:testquest/soc/data/rest/api/models/post_api_model.dart';
import 'package:testquest/soc/domain/entities/post_entity.dart';

 class PostsRepository {
   Db database;
   PostsLocalDataSource postsLocalDataSource;
   PostsApiDataSource postsApiDataSource;

   PostsRepository(this.database){
     postsLocalDataSource = PostsLocalDataSource(database);
     postsApiDataSource = PostsApiDataSource();
     getPosts();
   }

  Stream<List<PostEntity>>watchPosts(){
    return postsLocalDataSource.watchPosts();
  }

   Future getPosts() async {
    List<PostApiModel> postsApiModels = await postsApiDataSource.getPosts();
    postsLocalDataSource.savePosts(postsApiModels.map((post) => post).toList());
  }
}