import 'package:internet/layoutcontainer/WidgetData.dart';

class LayoutSource {
  List<WidgetData> list = [WidgetData("NEWS"),WidgetData("PRIVACY"),WidgetData("NEWS")];
  List<WidgetData> get() {
    return list;
  }

  void set(List<WidgetData> list) {
    this.list.clear();
    this.list.addAll(list);
  }
}