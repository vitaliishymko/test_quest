import 'package:testquest/soc/data/db/posts_database.dart';
import 'package:testquest/soc/data/rest/api/models/post_api_model.dart';
import 'package:testquest/soc/domain/entities/post_entity.dart';
import 'package:testquest/soc/data/models/post_extention.dart';

class PostsLocalDataSource {
  Db database;

  PostsLocalDataSource(this.database);

  Stream<List<PostEntity>> watchPosts(){
    return database.postsDao.watchPosts().map(
            (posts) => posts.map((post) => post.toEntity()).toList()
    );
  }

  savePosts(List<PostApiModel> posts){
    database.postsDao.insertPosts(posts);
  }
}