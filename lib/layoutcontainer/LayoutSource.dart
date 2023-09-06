import 'dart:developer';
import 'dart:html';

import 'package:internet/layoutcontainer/WidgetData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LayoutSource {
  LayoutSource._privateConstructor();
  static final LayoutSource _instance = LayoutSource._privateConstructor();

  factory LayoutSource() {
    return _instance;
  }
  List<WidgetData> list =[];

  int getSize(String key) {
    switch(key) {
      case "NEWS":
        return 9;
    }
    return 2;
  }
  Future<List<WidgetData>> load() async {
    log("LayoutSource load()");
    var pref = await SharedPreferences.getInstance();
    List<String>? keyList = pref.getStringList("order");
    log("LayoutSource load()1 $keyList");

    if(keyList == null) {
      list = [WidgetData("QUICK_ACCESS",2),WidgetData("PRIVACY",2),WidgetData("NEWS",9)];
      return list;
    }
    log("LayoutSource load() ${keyList.length}");
    if(list.isNotEmpty) {
      list.clear();
    }
    for(var key in keyList!) {
      log("key $key");
      var widgetData = WidgetData(key, getSize(key));
      log("key2 $key");
      list.add(widgetData);
      log("key end $key");

    }
    return list;
  }

  Future<void> reorder(int oldIndex, int newIndex) async {
    log("reorder $oldIndex $newIndex");
    if (newIndex > list.length) {
      newIndex = list.length;
    }
    if (oldIndex < newIndex) {
      newIndex--;
    }
    var oldItem = list[oldIndex];
    list.remove(oldItem);
    list.insert(newIndex, oldItem);
    List<String> strList = [];
    for(var item in list) {
      strList.add(item.key);
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("order", strList);
  }
}