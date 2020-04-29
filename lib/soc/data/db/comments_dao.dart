import 'package:moor_flutter/moor_flutter.dart';
import 'package:testquest/soc/data/db/posts_database.dart';

part 'comments_dao.g.dart';

@UseDao(tables: [Posts, Comments])
class CommentsDao extends DatabaseAccessor<Db> with _$CommentsDaoMixin {
  Db db;

  CommentsDao(this.db) : super(db);

  Future<List<Comment>> getComments() => select(comments).get();

  Stream<List<Comment>> watchComments(int postId) =>
      (select(comments)..where((comment) => comment.postId.equals(postId)))
          .watch();

  Future<void> insertComments(List<Comment> commentsList) async {///do not know yet how to insert collection
    delete(comments);
    for(int i = 0; i < commentsList.length; i++){
      into(comments).insert(commentsList[i]);
    }
  }
}
