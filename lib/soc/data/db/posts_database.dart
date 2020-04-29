import 'package:moor_flutter/moor_flutter.dart';
import 'package:testquest/soc/data/db/posts_dao.dart';

part 'posts_database.g.dart';

@UseMoor(tables: [Posts, Comments], daos: [PostsDao])
class Db extends _$Db {
  Db() : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'db.database', logStatements: true)
  );

  @override
  int get schemaVersion => 1;
}

class Posts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  TextColumn get title => text()();
  TextColumn get body => text()();
}

class Comments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get postId => integer()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get body => text()();
}
