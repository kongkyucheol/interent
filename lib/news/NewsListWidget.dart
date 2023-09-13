import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internet/news/NewsRepo.dart';
import 'package:internet/news/source/CNN.dart';
import 'package:internet/news/source/RemoteNews.dart';
import 'NewsData.dart';
import 'NewsListItemWidget.dart';


class NewsListWidget extends StatefulWidget {
  NewsListWidget({Key? key, required this.repo}) :
        super(key: key);

  NewsRepo repo;

  @override
  State<StatefulWidget> createState() => _NewsListWidgetState(newsRepo: this.repo);
}

class _NewsListWidgetState extends State<NewsListWidget> {
  List<NewsData> newsList = [];
  NewsRepo newsRepo;

  _NewsListWidgetState({required this.newsRepo});

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    log('loadData()');
    var curNewList = await newsRepo.getNews();
    log('loadData() end: $curNewList');
    setState(() {
      newsList = curNewList;
    });
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
        backgroundColor: Colors.transparent,
        body: getBody()
    );
  }



}