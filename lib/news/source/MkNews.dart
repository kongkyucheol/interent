
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:internet/news/News.dart';
import 'package:internet/news/NewsRepo.dart';

class MkNews extends NewsRepo{
  var realUrl = 'https://www.mk.co.kr/rss/30000001/';
  var url = 'https://proxy.cors.sh/';

  @override
  Future<List<News>> getNews() async {
    log('getNews()');

    http.Response response = await http.get(Uri.parse(url+realUrl), headers: {'x-cors-api-key': 'temp_90187d21e8a5f09d27a92fe565876075', });
    //http.Response response = await http.get(Uri.parse(url));
    log('getNews2() ${response.statusCode}');

    // var list = jsonDecode(response.body)['articles'];
    // var newsList = (list as List).map((i) => NewsRepo.fromGoogleJson(i)).toList();
    // log('newsList ${newsList.length}');
    // if(newsList.isEmpty) {
      List<News>  newsList = [];
      var emptyNews = News();
      emptyNews.description= response.body;
      emptyNews.label = "error";
      newsList.add(emptyNews);
    // }
    return newsList;
  }

  static News fromGoogleJson(jsonData) {
    var news = News();
    news.description = parse(jsonData,'description');

    news.label = parse(jsonData,'title');

    news.actionUri = parse(jsonData,'url');

    news.iconUri = parse(jsonData,'urlToImage');
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
