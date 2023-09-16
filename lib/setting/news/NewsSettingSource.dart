import 'dart:convert';
import 'dart:developer';
import '../../Const.dart';
import 'NewsSettingData.dart';
import 'package:http/http.dart' as http;

class NewsSettingSource {
  Future<List<NewsSettingData>> getNewsSettingDataList() async {
    final response = await http.get(Uri.parse(Const.BACK_END_URL));
    log("NewsSettingSource ${response.body}");
    var list = jsonDecode(response.body);
    var newsList = (list as List).map((i) => NewsSettingSource.fromRemoteJson(i)).toList();
    return newsList;
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

  void update(List<NewsSettingData> newsSettingDataList) async{
    //change to json
    var json = jsonEncode(newsSettingDataList.map((e) => e.toJson()).toList());

    var response = await http.post(Uri.parse(Const.BACK_END_URL),
        headers: {"user-agent":"linux", "Content-Type": "application/json"},
        body: json);
    log(response.body);
  }
}