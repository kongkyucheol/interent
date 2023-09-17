
import 'dart:developer';

import 'package:flutter/gestures.dart';
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
    NewsSettingData(key:"Open News",title: "OpenNews",valid: true),
  ];
  
  List<Widget> getTabTitleWidget() {
    List<Widget> result =  mList.map((adminData) => Text(adminData.title)).toList();
    log("getTabTitleWidget ${result.length}");
    return result;
  }

  String convertUrl(String key) {
    switch(key) {
      case 'Open News': return Const.OPENNEWS;
      case 'hd_all': return Const.HD_ALL;
      case 'hd_finance': return Const.HD_FINANCE;
    }
    var serverMap = { for (var e in mList) e.key : e };
    if(!serverMap.containsKey(key)) {
      return Const.OPENNEWS;
    }
    var result = Const.DYNAMIC_NEWS + serverMap[key]!.url;
    log('covertUrl:$result');
    return result;
  }
  List<Widget> getNewsListWidget() {
    //TODO: chnaged server news list
    log("getNewsListWidget starat");

    List<Widget> result =  mList.map((adminData) =>
        NewsListWidget(repo: RemoteNewsGet(url:convertUrl(adminData.key)))).toList();
    log("getNewsListWidget ${result.length}");
    return result;
  }
  
  Future<void> initAdminDataList() async {
    mList = await newsSettingSource.getValidList();
    log("initAdminDataList ${mList.length}");
  }

  int getLength() {
    return mList.length;
  }

}