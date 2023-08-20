import 'package:flutter/material.dart';
import 'package:internet/ui/repository/ContentRepository.dart';

import 'news/NewsListWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ContentRepository contentRepository = ContentRepository();
  List<Content> getContents() {
    return contentRepository.getContentList();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Column(
        children: <Widget>[
          Expanded( // Vertical ListView
            flex: 1,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  color: Colors.orange[(index % 9) * 100],
                  child: Text(index.toString()),
                );
              },
            ),
          ),
          const Expanded(
              flex: 9,
            child: NewsListWidget(),
          ),
        ]
      )
    );
  }
}
