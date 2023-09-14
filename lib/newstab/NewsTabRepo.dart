import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../Const.dart';
import '../admin/AdminData.dart';
import 'package:http/http.dart' as http;

import '../news/NewsListWidget.dart';
import '../news/source/RemoteNewsGet.dart';

class NewsTabRepo {
  NewsTabRepo._privateConstructor();
  static final NewsTabRepo _instance = NewsTabRepo._privateConstructor();

  factory NewsTabRepo() {
    return _instance;
  }
  
  List<AdminData> mList =  [
    AdminData(key:"opennews",title: "OPenNews",valid: true),
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
    final response = await http.get(Uri.parse(Const.BACK_END_URL));
    var list = jsonDecode(response.body);

    log("initAdminDataList1 ${list.length}");
    var filterList = (list as List).where((e){log('initAdminDataList:$e');
      return (e['valid']==true);}
    ).toList();
    log("initAdminDataList2 ${filterList.length}");

    var newsList = (filterList as List).map((i) => NewsTabRepo.fromRemoteJson(i)).toList();
    log("initAdminDataList ${newsList.length}");

    mList.clear();
    mList.addAll(newsList);
    log("initAdminDataList ${mList.length}");

  }

  static AdminData fromRemoteJson(jsonData) {
    var news = AdminData();
    news.key = parse(jsonData,'key');
    news.title = parse(jsonData,'title');
    news.urlType = parse(jsonData,'urlType');
    news.validTime = parse(jsonData,'valid_time');
    news.valid = parse(jsonData,'valid');

    log('fromGoogleJson() End ${news.key}');
    return news;
  }

  static dynamic parse(dynamic jsonData, key) {
    if(jsonData.containsKey(key)) {
      if(jsonData[key] == null) {
        return "";
      }
      return jsonData[key];
    }
    return "";
  }

  void update(List<AdminData> adminDataList) async{
    //change to json
    var json = jsonEncode(adminDataList.map((e) => e.toJson()).toList());

    var response = await http.post(Uri.parse(Const.BACK_END_URL),
        headers: {"user-agent":"linux", "Content-Type": "application/json"},
        body: json);
    log(response.body);
  }
}