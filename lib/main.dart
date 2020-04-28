import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'package:testquest/soc/data/data_sources/api/post_api_service.dart';
import 'package:testquest/soc/presentation/pages/posts_page.dart';

void main() {
  runApp(MyApp());
  switchOnLogging();
}

void switchOnLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord
      .listen((logData) => print('${logData.level.name} : ${logData.message}'));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PostApiService.create(),
      dispose: (_, PostApiService service) => service.client.dispose(),
      child: MaterialApp(
        title: 'Posts test quest',
        home: PostsPage(),
      ),
    );
  }
}
