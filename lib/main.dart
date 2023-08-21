import 'package:flutter/material.dart';
import 'package:internet/quickaccess/QuickAccessGridWidget.dart';
import 'package:internet/ui/repository/ContentRepository.dart';

import 'news/NewsListWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  ContentRepository contentRepository = ContentRepository();
  List<Content> getContents() {
    return contentRepository.getContentList();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internet Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: QuickAccessGridWidget(),
          ),
          Expanded(
            flex: 2,
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40,),
                Text("이번 주 원하지 않는 리다이랙션 8개를 차단했습니다.",
                  style: TextStyle(fontSize: 20, color:Colors.black),
                  textAlign: TextAlign.center,),
                SizedBox(height: 40,),
              ],
            )
          ),
          Expanded(
              flex: 9,
            child: NewsListWidget(),
          ),
        ]
      )
    );
  }
}
