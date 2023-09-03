import 'package:flutter/widgets.dart';
import '../news/NewsContainer.dart';
import '../privacy/PrivacyWidget.dart';
import '../quickaccess/QuickAccessContainer.dart';

class WidgetFactory {
  static Widget create(key,int size) {
    switch(key) {
      case "NEWS":
        return Expanded(
            flex: size,
            child: const NewsContainer()
        );
        return const NewsContainer();
      case "PRIVACY":
        return Expanded(
            flex: size,
            child: const PrivacyWidget()
        );
      case "QUICK_ACCESS":
        return Expanded(
            flex: size ,
            child: const QuickAccessContainer()
        );
    }
    return const Text("error");
  }
}