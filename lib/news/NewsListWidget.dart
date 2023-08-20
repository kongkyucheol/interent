import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internet/news/NewsRepo.dart';
import 'News.dart';
import 'NewsListItemWidget.dart';
import '../shortcut/ShortcutList.dart';


class NewsListWidget extends StatefulWidget {
  const NewsListWidget({Key? key}) :
        super(key: key);

  @override
  State<StatefulWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  List<News> newsList = [];
  NewsRepo newsRepo = NewsRepo();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Widget getBody() {
    bool showLoadingDialog = newsList.isEmpty;
    if(showLoadingDialog) {
      return getProgressDialog();
    }else {
      return getListView();
    }
  }

  Widget getProgressDialog() {
    return const Center(child:CircularProgressIndicator());
  }

  Widget getListView() {
    return ListView.builder(
      itemCount: newsList.length ,
      itemBuilder: (context, position) {
        return getRow(position);
      },
    );
  }

  Widget getRow(int i) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: NewsListItemWidget(newsList[i]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody()
    );
  }

  Future<void> loadData() async {
    log('loadData()');
    var curNewList = await newsRepo.getNews();
    log('loadData() end: $curNewList');
      setState(() {
        newsList = curNewList;
      });
  }

}