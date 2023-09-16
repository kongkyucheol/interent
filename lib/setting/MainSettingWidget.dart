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
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          navigatorWrapper.go(NavigatorWrapper.ROOT);
        },
        icon: Icon(Icons.settings),
        label: const Text('apply'),
        elevation: 15,
      ),
      body:ReorderableListView(
        buildDefaultDragHandles: false,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: createWidget(),
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            layoutSource.reorder(oldIndex,newIndex);
          });
        },
      )
    );
  }

  List<Widget> createWidget() {
    log("createWidget $list");
    List<Widget> widgetList = [];
    for (int index = 0; index< list.length; index++) {
      var element = list[index];
      var container = Container(
        key: Key(element.key),
        child: GestureDetector(
          onTap: () {_onTap(element.key);},
          child: ListTile(
              trailing: ReorderableDragStartListener(index:index, child:Icon(Icons.drag_handle)),
              key: Key('$index'),
              title:Text(element.key)),
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
    navigatorWrapper.go(NavigatorWrapper.NEWS_SETTING);
  }
}