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
    news.validTime = parse(jsonData,'valid_time');
    news.valid = parse(jsonData,'valid');
    news.url = parse(jsonData,'url');

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

  Future<void> upload(String jsonString) async{
    List<dynamic> temp = jsonDecode(jsonString);
    var body = json.encode(temp);
    printWrapped("upload: $body");

    var response = await http.post(Uri.parse(Const.BACK_END_URL),
        headers: {"user-agent":"linux", "Content-Type": "application/json"},
        body: body);
    printWrapped("uploaded" + response.body);
  }
  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}