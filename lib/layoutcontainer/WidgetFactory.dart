import 'package:flutter/widgets.dart';
import 'package:internet/news/NewsListWidget.dart';
import 'package:internet/quickaccess/QuickAccessGridWidget.dart';
import 'package:internet/quickaccess/QuickAccessWidget.dart';

import 'WidgetData.dart';

class WidgetFactory {
  Widget? create(WidgetData widgetData) {
    switch(widgetData.key) {
      case "NEWS":
        return const NewsListWidget();
      // case "PRIVACY":
      //   return const PrivacyWidget();
      case "QUICK_ACCESS":
        return const QuickAccessGridWidget();
    }
    return null;
  }
}