import 'package:dotted_border/dotted_border.dart';
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
      home: Container(
            color:Colors.blue,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Scaffold(
                        floatingActionButton: FloatingActionButton.small(
                          onPressed: () {  },
                          child: const Text("DEL"),

                        ),
                        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,

                        body: DottedBorder(
                          borderType: BorderType.Rect,
                          padding: EdgeInsets.all(3),
                          borderPadding: EdgeInsets.all(3),
                          child: QuickAccessGridWidget(),
                        ),
                      )


                    ),
                    Expanded(
                        flex: 2,
                        child: Scaffold(
                            backgroundColor: Colors.blue,
                            floatingActionButton: FloatingActionButton.small(
                              onPressed: () {  },
                              child: const Text("DEL"),

                            ),
                            floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,

                            body:DottedBorder(
                            borderType: BorderType.Rect,
                            borderPadding: EdgeInsets.all(3),
                            child: const Column (
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 40,),
                                Text("이번 주 원하지 않는 리다이랙션 8개를 차단했습니다.",
                                  style: TextStyle(fontSize: 20, color:Colors.black),
                                  textAlign: TextAlign.left,),
                                SizedBox(height: 40,),
                              ],
                            )
                        )

                      ),
                    ),
                    Expanded(
                        flex: 9,
                        child: Scaffold(
                            backgroundColor: Colors.blue,
                            floatingActionButton: FloatingActionButton.small(
                              onPressed: () {  },
                              child: const Text("DEL"),

                            ),
                            floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,

                            body:DottedBorder(
                          borderType: BorderType.Rect,
                          child: const NewsListWidget(),
                        )
                      ),
                    )

                  ]
              ),
            )
        ),


    );
  }
}
