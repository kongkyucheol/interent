//https://pub.dev/packages/drag_and_drop_lists

import 'package:flutter/material.dart';
import 'package:internet/ui/repository/ContentRepository.dart';
import 'layoutcontainer/LayoutContainerWidget.dart';

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
      home: const LayoutContainerWidget(),
    );
  }
}
