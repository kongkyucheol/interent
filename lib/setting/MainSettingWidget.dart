import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:internet/NavigatorWrapper.dart';
import 'package:internet/layoutcontainer/LayoutSource.dart';
import 'dart:html' as html;
import '../layoutcontainer/WidgetData.dart';

class MainSettingWidget extends StatefulWidget {
  const MainSettingWidget({Key? key}) : super(key: key);


  @override
  State<MainSettingWidget> createState() => _MainSettingWidgetState();
}

class _MainSettingWidgetState extends State<MainSettingWidget> {
  final LayoutSource layoutSource = LayoutSource();

  List<WidgetData> list = [];
  @override
  void initState() {
    super.initState();
    log("initState");
    layoutSource.load().then(
        (List<WidgetData> widgetList) => {
          setState(() {
            list = widgetList;
          })
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      children: createWidget(),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          layoutSource.reorder(oldIndex,newIndex);
        });
      },
    );
  }

  List<Widget> createWidget() {
    log("createWidget $list");
    List<Widget> widgetList = [];
    for (var element in list) {
      var container = Container(
        key: Key(element.key),
        child: GestureDetector(
          onTap: () {_onTap(element.key);},
          child: Text(element.key),
        )
      );
      widgetList.add(container);
    }
    return widgetList;
  }

  NavigatorWrapper navigatorWrapper = NavigatorWrapper();
  void _onTap(String key) {
    log("_onTap $key");
    if(key != "NEWS") {
      return;
    }
    // Navigator.of(context).pushNamed('/admin');
    navigatorWrapper.go('/admin');
  }
}