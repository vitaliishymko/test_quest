import 'package:moor_flutter/moor_flutter.dart';
import 'package:testquest/soc/data/db/posts_database.dart';
import 'package:testquest/soc/data/rest/api/models/post_api_model.dart';

part 'posts_dao.g.dart';

@UseDao(tables: [Posts, Comments])
class PostsDao extends DatabaseAccessor<Db> with _$PostsDaoMixin {
  Db db;

  PostsDao(this.db) : super(db);

  Stream<List<Post>> watchPosts() => select(posts).watch();

  void insertPosts(List<PostApiModel> postsList) async {
    await batch((b) {
      b.insertAll(
        posts,
        postsList.map((post) => PostsCompanion(
          id: Value(post.id),
          userId: Value(post.userId),
          title: Value(post.title),
          body: Value(post.body)
        )).toList(),
      );
    });
  }
}
