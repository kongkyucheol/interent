import 'package:internet/layoutcontainer/WidgetData.dart';

class LayoutSource {
  List<WidgetData> list = [WidgetData("QUICK_ACCESS",2),WidgetData("PRIVACY",2),WidgetData("NEWS",9)];
  List<WidgetData> get() {
    return list;
  }

  void set(List<WidgetData> list) {
    this.list.clear();
    this.list.addAll(list);
  }
}