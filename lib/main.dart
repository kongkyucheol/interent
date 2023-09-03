import 'package:flutter/material.dart';
import 'package:internet/setting/testlist.dart';
import 'package:internet/ui/repository/ContentRepository.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

//http://localhost:60036/?setting=true
  @override
  Widget build(BuildContext context) {
    final Uri uri = Uri.base;
    var isSetting = uri.queryParameters['setting']?.toLowerCase() == "true";
    if(isSetting) {
      return const MaterialApp(
        home:DragHandleExample()
      );
    }
    return MaterialApp(
      title: "flutter ex",
      initialRoute: '/',
      routes: {
        '/': (context) => LayoutContainerWidget(),
        '/setting': (context) => LayoutContainerWidget(),
      },
    );
  }
}