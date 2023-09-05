import 'dart:developer';
import 'dart:html';

import 'package:internet/layoutcontainer/WidgetData.dart';

class LayoutSource {
  LayoutSource._privateConstructor();
  static final LayoutSource _instance = LayoutSource._privateConstructor();

  factory LayoutSource() {
    return _instance;
  }
  List<WidgetData> list = [WidgetData("QUICK_ACCESS",2),WidgetData("PRIVACY",2),WidgetData("NEWS",9)];
  List<WidgetData> get() {
    return list;
  }

  void set(List<WidgetData> list) {
    this.list.clear();
    this.list.addAll(list);
  }

  void reorder(int oldIndex, int newIndex) {
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
  }
}