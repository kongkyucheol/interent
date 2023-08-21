import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internet/news/NewsRepo.dart';
import 'package:internet/news/source/CNN.dart';
import 'NewsData.dart';
import 'NewsListItemWidget.dart';


class NewsListWidget extends StatefulWidget {
  const NewsListWidget({Key? key}) :
        super(key: key);

  @override
  State<StatefulWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  List<NewsData> newsList = [];
  NewsRepo newsRepo = CNNNews();

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