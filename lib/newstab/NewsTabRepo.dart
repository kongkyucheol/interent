import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../Const.dart';
import '../admin/AdminData.dart';
import 'package:http/http.dart' as http;

import '../news/NewsListWidget.dart';

class NewsTabRepo {
  NewsTabRepo._privateConstructor();
  static final NewsTabRepo _instance = NewsTabRepo._privateConstructor();

  factory NewsTabRepo() {
    return _instance;
  }
  
  List<AdminData> mList = List.empty(growable: true);
  
  List<Widget> getTabTitleWidget() {
    List<Widget> result =  mList.map((adminData) => Text(adminData.title)).toList();
    log("getTabTitleWidget ${result.length}");
    return result;
  }

  List<Widget> getNewsListWidget() {
    //TODO: chnaged server news list
    return [
      NewsListWidget(),
      NewsListWidget(),
      NewsListWidget()
    ];
  }
  
  
  Future<void> initAdminDataList() async {
    final response = await http.get(Uri.parse(Const.BACK_END_URL));
    var list = jsonDecode(response.body);
    var newsList = (list as List).map((i) => NewsTabRepo.fromRemoteJson(i)).toList();

    mList.clear();
    mList.addAll(newsList);
    log("AdminSettingSource ${mList.length}");

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