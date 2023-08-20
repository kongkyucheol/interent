
import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart' as http;
import 'package:internet/news/News.dart';
import 'package:internet/news/NewsRepo.dart';
import 'package:xml/xml.dart';

class CNNNews extends NewsRepo{
  var realUrl = 'http://rss.cnn.com/rss/edition.rss';
  var url = 'https://proxy.cors.sh/';

  void printWrapped(String text) {
    final pattern = RegExp('.{1,1000}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  @override
  Future<List<News>> getNews() async {
    log('CNN:getNews()');
    var uri = Uri.parse(realUrl);
    http.Response response = await http.get(uri);
    //http.Response response = await http.get(Uri.parse(url+realUrl), headers: {'x-cors-api-key': 'temp_42f9e07968709f8ff76b70fdf91aec78', });

    log('CNN:getNews2() ${response.statusCode}');
    log('CNN:getNews2() ${response.body}');

    var xmlData = XmlDocument.parse(response.body);
    Iterable<XmlElement> elements = xmlData.rootElement.findAllElements("item");

    List<News> list = [];
    for(var element in elements) {
      // log("${element.getElement("title")?.text}");
      // log("${element.getElement("media:group")?.getElement("media:content")?.getAttribute("url")}");
      News news = News();
      news.description = element.getElement("title")?.text??"empty";
      news.iconUri = element.getElement("media:group")?.getElement("media:content")?.getAttribute("url")??"";
      news.actionUri = element.getElement("link")?.text??"";
      list.add(news);
    }
    return list;
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
