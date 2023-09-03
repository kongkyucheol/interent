import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:internet/privacy/PrivacyWidget.dart';
import 'package:internet/quickaccess/QuickAccessContainer.dart';
import 'package:internet/quickaccess/QuickAccessGridWidget.dart';
import 'package:internet/ui/repository/ContentRepository.dart';

import 'layoutcontainer/LayoutContainerWidget.dart';
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
      home: const LayoutContainerWidget(),
    );
  }
}
