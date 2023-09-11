import 'package:flutter/material.dart';
import 'package:internet/Navigator.dart';
import 'package:internet/setting/MainSettingWidget.dart';
import 'package:internet/setting/MainSettingContainer.dart';
import 'package:internet/ui/repository/ContentRepository.dart';
import 'admin/AdminSettingContainer.dart';
import 'admin/AdminSettingStateWidget.dart';
import 'layoutcontainer/LayoutContainerWidget.dart';
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
    var isSetting = uri.queryParameters['setting']?.toLowerCase() == "true";
    if(isSetting) {
      return MaterialApp(
        title: "flutter ex",
        initialRoute: '/',
        routes: {
          '/': (context) =>  MainSettingContainer(),
          '/admin': (context) => const AdminSettingContainer(),
        },
      );
    }
    return MaterialApp(
      title: "flutter ex",
      initialRoute: '/',
      routes: {
        '/': (context) => LayoutContainerWidget(),
      },
    );
  }
}