
import 'dart:convert';
import 'dart:developer';

import 'News.dart';
import 'package:http/http.dart' as http;

class NewsRepo {
  var url = Uri.parse("https://newsapi.org/v2/everything?q=bitcoin&from=2023-08-06&sortBy=publishedAt&apiKey=3a48b12063b0415f9359490b7907ab46");

  Future<List<News>> getNews() async {
    log('getNews()');
    http.Response response = await http.get(url);
    var list = jsonDecode(response.body)['articles'];
    var newsList = (list as List).map((i) => NewsRepo.fromGoogleJson(i)).toList();
    log('newsList ${newsList.length}');
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
