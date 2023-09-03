import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:internet/privacy/PrivacyWidget.dart';
import 'package:internet/quickaccess/QuickAccessContainer.dart';
import 'package:internet/quickaccess/QuickAccessGridWidget.dart';
import 'package:internet/ui/repository/ContentRepository.dart';

import 'news/NewsContainer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  ContentRepository contentRepository = ContentRepository();
  List<Content> getContents() {
    return contentRepository.getContentList();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internet Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
            color:Colors.blue,
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: QuickAccessContainer()
                    ),
                    Expanded(
                        flex: 2,
                        child: PrivacyWidget()),
                    Expanded(
                        flex: 9,
                        child: NewsContainer(),
                      ),
                  ]
              ),
            )
        ),
    );
  }
}
