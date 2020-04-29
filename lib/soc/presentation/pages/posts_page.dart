import 'package:flutter/material.dart';
import 'package:testquest/soc/data/db/posts_database.dart';
import 'package:testquest/soc/domain/entities/post_entity.dart';
import 'package:testquest/soc/domain/repositories/posts_repository.dart';
import 'package:testquest/soc/domain/use_cases/posts_use_case.dart';

import 'comments_page.dart';

class PostsPage extends StatelessWidget {
  PostsUseCase postsUseCase = PostsUseCase(
      PostsRepository(Db())); //didn't have much time for better solution and dependency injection

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Test quest'),
      ),
      body: _buildBody(context),
    );
  }

  StreamBuilder<List> _buildBody(BuildContext context) {
    return StreamBuilder<List<PostEntity>>(
      stream: postsUseCase.watchList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active && snapshot.data != null) {
          return _preparePostsLIstView(context, snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _preparePostsLIstView(BuildContext context, List<PostEntity> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          child: ListTile(
            title: Text(
              posts[index].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index].body),
            onTap: () => _openComments(context, posts[index].id),
          ),
        );
      },
    );
  }

  void _openComments(BuildContext context, int postId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CommentsPage(postId: postId),
      ),
    );
  }
}
