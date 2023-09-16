
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internet/setting/news/NewsSettingSource.dart';

import '../Const.dart';
import '../news/NewsListWidget.dart';
import '../news/source/RemoteNewsGet.dart';
import '../setting/news/NewsSettingData.dart';

class NewsTabRepo {
  NewsTabRepo._privateConstructor();
  static final NewsTabRepo _instance = NewsTabRepo._privateConstructor();

  factory NewsTabRepo() {
    return _instance;
  }

  NewsSettingSource newsSettingSource = NewsSettingSource();

  List<NewsSettingData> mList =  [
    NewsSettingData(key:"opennews",title: "OpenNews",valid: true),
  ];
  
  List<Widget> getTabTitleWidget() {
    List<Widget> result =  mList.map((adminData) => Text(adminData.title)).toList();
    log("getTabTitleWidget ${result.length}");
    return result;
  }

  String convertUrl(String key) {
    switch(key) {
      case 'opennews': return Const.OPENNEWS;
      case 'hd_all': return Const.HD_ALL;
      case 'hd_finance': return Const.HD_FINANCE;
    }
    return Const.OPENNEWS;
  }
  List<Widget> getNewsListWidget() {
    //TODO: chnaged server news list
    List<Widget> result =  mList.map((adminData) =>
        NewsListWidget(repo: RemoteNewsGet(url:convertUrl(adminData.key)))).toList();
    return result;
  }
  
  Future<void> initAdminDataList() async {
    mList = await newsSettingSource.getValidList();
    log("initAdminDataList ${mList.length}");

  }

}