import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testquest/soc/data/data_sources/api/post_api_service.dart';

class CommentsPage extends StatelessWidget {
  int postId;

  CommentsPage({this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test quest'),
      ),
      body: _buildBody(context, postId),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context, int postId) {
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getCommentsForPost(postId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List comments = json.decode(snapshot.data.bodyString);
          return _preparePostsLIstView(context, comments);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _preparePostsLIstView(BuildContext context, List comments){
    return ListView.builder(itemCount: comments.length,
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index){
        return Card(
          elevation: 3,
          child: ListTile(
            title: Text(
              comments[index]['name'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(comments[index]['body']),
          ),
        );
      },
    );
  }


}
