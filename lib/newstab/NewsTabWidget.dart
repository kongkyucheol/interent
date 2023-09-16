import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internet/news/NewsListWidget.dart';
import 'package:internet/newstab/NewsTabRepo.dart';

class NewsTabWidget extends StatefulWidget {
  const NewsTabWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewsTabState();
}



class _NewsTabState extends State<NewsTabWidget> {

  NewsTabRepo newsTabRepo = NewsTabRepo();

  @override
  void initState() {
    super.initState();
    loadData();

  }

  Future<void> loadData() async {
    log('loadData()');
    await newsTabRepo.initAdminDataList();
    setState(() {
      log('loaded()');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            bottom: TabBar(
              tabs: newsTabRepo.getTabTitleWidget(),
            ),
            title: const Text('News',style: TextStyle(fontSize: 15, color:Colors.black,decoration: TextDecoration.none),
            ),
          ),
          body: TabBarView(
            children: newsTabRepo.getNewsListWidget(),
          ),
        ),
      ),
    );
  }


}