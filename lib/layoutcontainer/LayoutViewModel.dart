

import 'package:flutter/material.dart';
import 'package:internet/layoutcontainer/LayoutSource.dart';
import 'package:internet/layoutcontainer/WidgetData.dart';

class LayoutViewModel extends ChangeNotifier {
  late final LayoutSource layoutSource;
  List<WidgetData> _widgetData = List.empty(growable: true);
  List<WidgetData> get widgetData => _widgetData;

  LayoutViewModel() {
    layoutSource = LayoutSource();
    _load();
  }

  Future<void> _load() async {
    _widgetData = await layoutSource.load();
    notifyListeners();
  }
}