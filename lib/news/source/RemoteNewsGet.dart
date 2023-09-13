import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:internet/news/NewsRepo.dart';

import '../../Const.dart';
import '../NewsData.dart';
import 'package:http/http.dart' as http;

class RemoteNewsGet extends NewsRepo{
  var url;


  RemoteNewsGet({this.url=Const.HD_FINANCE});



  @override
  Future<List<NewsData>> getNews() async {
    log('Remote getNews() $url');
    http.Response response = await http.get(Uri.parse(url));
    // Map data = {"max_count": 100};
    // var body = json.encode(data);
    //
    // var response = await http.get(Uri.parse(url),
    //           headers: {"user-agent":"linux", "Content-Type": "application/json"},
    //           body: body);
    log('Remote getNews() response = ${response.body}');

    var list = jsonDecode(response.body);
    var newsList = (list as List).map((i) => RemoteNewsGet.fromRemoteJson(i)).toList();
    log('newsList ${newsList.length}');
    if(newsList.isEmpty) {
    // List<NewsData>  newsList = [];
    // var emptyNews = NewsData();
    // emptyNews.description= response.body;
    // emptyNews.label = "error";
    // newsList.add(emptyNews);
    }
    return newsList;
  }

  // 'datetime': service.datetime,
  // 'fromSource': service.fromSource}
  static NewsData fromRemoteJson(jsonData) {
    var news = NewsData();
    news.description = parse(jsonData,'description');
    news.label = parse(jsonData,'title');
    news.actionUri = parse(jsonData,'http');
    news.iconUri = parse(jsonData,'thumbnail');
    log('fromGoogleJson() End ${news.iconUri}');
    return news;
  }

  static String parse(dynamic jsonData, key) {
    if(jsonData.containsKey(key)) {
      if(jsonData[key] == null) {
        return "";
      }
      return jsonData[key];
    }
    return "";
  }
}