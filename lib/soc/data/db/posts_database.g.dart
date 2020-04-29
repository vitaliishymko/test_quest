// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Post extends DataClass implements Insertable<Post> {
  final int id;
  final int userId;
  final String title;
  final String body;
  Post(
      {@required this.id,
      @required this.userId,
      @required this.title,
      @required this.body});
  factory Post.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Post(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      body: stringType.mapFromDatabaseResponse(data['${effectivePrefix}body']),
    );
  }
  factory Post.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Post(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
    };
  }

  @override
  PostsCompanion createCompanion(bool nullToAbsent) {
    return PostsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
    );
  }

  Post copyWith({int id, int userId, String title, String body}) => Post(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        body: body ?? this.body,
      );
  @override
  String toString() {
    return (StringBuffer('Post(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(userId.hashCode, $mrjc(title.hashCode, body.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Post &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.body == this.body);
}

class PostsCompanion extends UpdateCompanion<Post> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> title;
  final Value<String> body;
  const PostsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
  });
  PostsCompanion.insert({
    @required int id,
    @required int userId,
    @required String title,
    @required String body,
  })  : id = Value(id),
        userId = Value(userId),
        title = Value(title),
        body = Value(body);
  PostsCompanion copyWith(
      {Value<int> id,
      Value<int> userId,
      Value<String> title,
      Value<String> body}) {
    return PostsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}

class $PostsTable extends Posts with TableInfo<$PostsTable, Post> {
  final GeneratedDatabase _db;
  final String _alias;
  $PostsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  GeneratedTextColumn _body;
  @override
  GeneratedTextColumn get body => _body ??= _constructBody();
  GeneratedTextColumn _constructBody() {
    return GeneratedTextColumn(
      'body',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, userId, title, body];
  @override
  $PostsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'posts';
  @override
  final String actualTableName = 'posts';
  @override
  VerificationContext validateIntegrity(PostsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.userId.present) {
      context.handle(
          _userIdMeta, userId.isAcceptableValue(d.userId.value, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (d.body.present) {
      context.handle(
          _bodyMeta, body.isAcceptableValue(d.body.value, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Post map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Post.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(PostsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.userId.present) {
      map['user_id'] = Variable<int, IntType>(d.userId.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.body.present) {
      map['body'] = Variable<String, StringType>(d.body.value);
    }
    return map;
  }

  @override
  $PostsTable createAlias(String alias) {
    return $PostsTable(_db, alias);
  }
}

class Comment extends DataClass implements Insertable<Comment> {
  final int id;
  final int postId;
  final String name;
  final String email;
  final String body;
  Comment(
      {@required this.id,
      @required this.postId,
      @required this.name,
      @required this.email,
      @required this.body});
  factory Comment.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Comment(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      postId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}post_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      body: stringType.mapFromDatabaseResponse(data['${effectivePrefix}body']),
    );
  }
  factory Comment.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Comment(
      id: serializer.fromJson<int>(json['id']),
      postId: serializer.fromJson<int>(json['postId']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'postId': serializer.toJson<int>(postId),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'body': serializer.toJson<String>(body),
    };
  }

  @override
  CommentsCompanion createCompanion(bool nullToAbsent) {
    return CommentsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      postId:
          postId == null && nullToAbsent ? const Value.absent() : Value(postId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
    );
  }

  Comment copyWith(
          {int id, int postId, String name, String email, String body}) =>
      Comment(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        name: name ?? this.name,
        email: email ?? this.email,
        body: body ?? this.body,
      );
  @override
  String toString() {
    return (StringBuffer('Comment(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(postId.hashCode,
          $mrjc(name.hashCode, $mrjc(email.hashCode, body.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Comment &&
          other.id == this.id &&
          other.postId == this.postId &&
          other.name == this.name &&
          other.email == this.email &&
          other.body == this.body);
}

class CommentsCompanion extends UpdateCompanion<Comment> {
  final Value<int> id;
  final Value<int> postId;
  final Value<String> name;
  final Value<String> email;
  final Value<String> body;
  const CommentsCompanion({
    this.id = const Value.absent(),
    this.postId = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.body = const Value.absent(),
  });
  CommentsCompanion.insert({
    @required int id,
    @required int postId,
    @required String name,
    @required String email,
    @required String body,
  })  : id = Value(id),
        postId = Value(postId),
        name = Value(name),
        email = Value(email),
        body = Value(body);
  CommentsCompanion copyWith(
      {Value<int> id,
      Value<int> postId,
      Value<String> name,
      Value<String> email,
      Value<String> body}) {
    return CommentsCompanion(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }
}

class $CommentsTable extends Comments with TableInfo<$CommentsTable, Comment> {
  final GeneratedDatabase _db;
  final String _alias;
  $CommentsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _postIdMeta = const VerificationMeta('postId');
  GeneratedIntColumn _postId;
  @override
  GeneratedIntColumn get postId => _postId ??= _constructPostId();
  GeneratedIntColumn _constructPostId() {
    return GeneratedIntColumn(
      'post_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  GeneratedTextColumn _body;
  @override
  GeneratedTextColumn get body => _body ??= _constructBody();
  GeneratedTextColumn _constructBody() {
    return GeneratedTextColumn(
      'body',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, postId, name, email, body];
  @override
  $CommentsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'comments';
  @override
  final String actualTableName = 'comments';
  @override
  VerificationContext validateIntegrity(CommentsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.postId.present) {
      context.handle(
          _postIdMeta, postId.isAcceptableValue(d.postId.value, _postIdMeta));
    } else if (isInserting) {
      context.missing(_postIdMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.email.present) {
      context.handle(
          _emailMeta, email.isAcceptableValue(d.email.value, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (d.body.present) {
      context.handle(
          _bodyMeta, body.isAcceptableValue(d.body.value, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Comment map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Comment.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CommentsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.postId.present) {
      map['post_id'] = Variable<int, IntType>(d.postId.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.email.present) {
      map['email'] = Variable<String, StringType>(d.email.value);
    }
    if (d.body.present) {
      map['body'] = Variable<String, StringType>(d.body.value);
    }
    return map;
  }

  @override
  $CommentsTable createAlias(String alias) {
    return $CommentsTable(_db, alias);
  }
}

abstract class _$Db extends GeneratedDatabase {
  _$Db(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $PostsTable _posts;
  $PostsTable get posts => _posts ??= $PostsTable(this);
  $CommentsTable _comments;
  $CommentsTable get comments => _comments ??= $CommentsTable(this);
  PostsDao _postsDao;
  PostsDao get postsDao => _postsDao ??= PostsDao(this as Db);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [posts, comments];
}
