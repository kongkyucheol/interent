import 'dart:convert';
import 'dart:developer';
import '../../Const.dart';
import 'NewsSettingData.dart';
import 'package:http/http.dart' as http;

class NewsSettingSource {

  NewsSettingSource._privateConstructor();
  static final NewsSettingSource _instance = NewsSettingSource._privateConstructor();

  factory NewsSettingSource() {
    return _instance;
  }

  Future<List<NewsSettingData>> getNewsSettingDataList() async {
    final response = await http.get(Uri.parse(Const.BACK_END_URL));
    log("NewsSettingSource ${response.body}");
    var list = jsonDecode(response.body);
    var newsList = (list as List).map((i) => NewsSettingSource.fromRemoteJson(i)).toList();
    var changedList = newsList.where((i)=> (i.valid)).toList();
    if(mList.isNotEmpty) {
      var serverMap = Map.fromIterable(mList,key:(e)=>e.key, value: (e) => e.checked);
      for (var element in changedList) {
        element.checked = serverMap[element.key];
      }
    }
    return changedList;
  }
  // String key = "";
  // String title = "";
  // String urlType = "";
  // String url = "";
  // bool valid = true;
  static NewsSettingData fromRemoteJson(jsonData) {
    var news = NewsSettingData();
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

  Future<List<NewsSettingData>> getValidList() async{
    final response = await http.get(Uri.parse(Const.BACK_END_URL));
    var list = jsonDecode(response.body);
    var serverList = (list as List).map((i) => NewsSettingSource.fromRemoteJson(i)).toList();
    if(mList.isEmpty) {
      mList.addAll(serverList);
      return mList;
    }

    var serverMap = { for (var element in serverList) element.key : element };
    var filteredList = mList.where((i) => (serverMap.containsKey(i.key))).toList();
    var changedList = filteredList.where((i)=> (i.checked && i.valid)).toList();
    log("getValidList ${changedList.length}");

    return changedList;
  }
  List<NewsSettingData> mList = List.empty(growable: true);

  void update(List<NewsSettingData> list) {
    mList.clear();
    mList.addAll(list);
  }

}