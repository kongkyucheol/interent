import 'package:flutter/material.dart';
import 'package:internet/quickaccess/QuickAccessContainer.dart';
import 'package:internet/setting/MainSettingContainer.dart';
import 'package:internet/setting/news/NewsSettingContainer.dart';
import 'package:internet/wallpaper/ColorPickerPage.dart';

import 'admin/AdminSettingContainer.dart';
import 'layoutcontainer/LayoutContainerWidget.dart';
import 'newstab/NewsTabWidget.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//
//   ContentRepository contentRepository = ContentRepository();
//   List<Content> getContents() {
//     return contentRepository.getContentList();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Internet Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const LayoutContainerWidget(),
//     );
//   }
// }


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

//http://localhost:60036/?setting=true
  @override
  Widget build(BuildContext context) {
    final Uri uri = Uri.base;
    var isSetting = uri.queryParameters['admin']?.toLowerCase() == "true";
    if(isSetting) {
      return MaterialApp(
        title: "AdminSetting",
        initialRoute: '/',
        routes: {
          '/': (context) =>  const AdminSettingContainer()
        },
      );
    }
    return MaterialApp(
      title: "flutter",
      initialRoute: '/',
      routes: {
        '/': (context) => LayoutContainerWidget(),
        '/setting': (context) =>  MainSettingContainer(),
        '/news_setting': (context) => const NewsSettingContainer(),
        '/color_picker':(context) => const ColorPickerPage()
      },
    );
  }
}