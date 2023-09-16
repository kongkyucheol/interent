import 'dart:developer';

import 'package:flutter/cupertino.dart';

class NavigatorWrapper {
  NavigatorWrapper._privateConstructor();
  static final NavigatorWrapper _instance = NavigatorWrapper._privateConstructor();

  static const ROOT = '/';
  static const SETTING = '/setting';
  static const NEWS_SETTING = '/news_setting';
  static const COLOR_PICKER = '/color_picker';

  BuildContext? buildContext;
  factory NavigatorWrapper() {
    return _instance;
  }

  void setContext(BuildContext buildContext) {
    this.buildContext = buildContext;
  }

  void go(String path) {
    if(buildContext == null) {
      log("go failed. $path");
      return;
    }
    Navigator.of(buildContext!).pushNamed(path);
  }
}