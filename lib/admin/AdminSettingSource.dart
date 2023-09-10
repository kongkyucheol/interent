import 'dart:convert';
import 'dart:developer';

import '../Const.dart';
import 'AdminData.dart';
import 'package:http/http.dart' as http;

class AdminSettingSource {
  Future<List<AdminData>> getAdminDataList() async {
    final response = await http.get(Uri.parse(Const.BACK_END_URL));
    log("AdminSettingSource ${response.body}");
    var list = jsonDecode(response.body);
    var newsList = (list as List).map((i) => AdminSettingSource.fromRemoteJson(i)).toList();
    return newsList;
  }
  // String key = "";
  // String title = "";
  // String urlType = "";
  // String url = "";
  // bool valid = true;
  static AdminData fromRemoteJson(jsonData) {
    var news = AdminData();
    news.key = parse(jsonData,'key');
    news.title = parse(jsonData,'title');
    news.urlType = parse(jsonData,'urlType');
    news.validTime = int.parse(parse(jsonData,'valid_time'));

    log('fromGoogleJson() End ${news.key}');
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