import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testquest/soc/data/data_sources/api/post_api_service.dart';

import 'comments_page.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test quest'),
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {

    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List posts = json.decode(snapshot.data.bodyString);
          return _preparePostsLIstView(context, posts);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _preparePostsLIstView(BuildContext context, List posts){
    return ListView.builder(itemCount: posts.length,
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index){
      return Card(
        elevation: 3,
        child: ListTile(
          title: Text(
            posts[index]['title'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(posts[index]['body']),
          onTap: () => _openComments(context, posts[index]['id']),
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



