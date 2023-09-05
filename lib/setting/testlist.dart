import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internet/layoutcontainer/LayoutSource.dart';

class ReorderableExample extends StatefulWidget {
  const ReorderableExample({Key? key}) : super(key: key);


  @override
  State<ReorderableExample> createState() => _ReorderableListViewExampleState();
}

class _ReorderableListViewExampleState extends State<ReorderableExample> {
  final LayoutSource layoutSource = LayoutSource();

  @override
  Widget build(BuildContext context) {

    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: createWidget(),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          layoutSource.reorder(oldIndex,newIndex);
        });
      },
    );
  }

  List<Widget> createWidget() {
    log("createWidget");
    List<Widget> widgetList = [];
    for (var element in layoutSource.list) {
      var container = Container(
          key: Key(element.key),
          child: Text(element.key)
      );
      widgetList.add(container);
    }
    return widgetList;
  }
}