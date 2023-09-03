
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet/layoutcontainer/LayoutViewModel.dart';
import 'package:internet/layoutcontainer/WidgetData.dart';
import 'package:provider/provider.dart';
import 'WidgetFactory.dart';

//https://totally-developer.tistory.com/115 참고.
class LayoutWidget extends StatefulWidget {
  bool isChangable = false;
  LayoutWidget(this.isChangable, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LayoutState(isChangable);
}

class _LayoutState extends State<LayoutWidget> {
  _LayoutState(this.isChangable);
  bool isChangable = false;
  late List<WidgetData> widgetDataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<LayoutViewModel> (
          builder: (BuildContext context, LayoutViewModel value, Widget? child){
            widgetDataList = value.widgetData;
            return MaterialApp(
              title: 'Internet Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: Container(
                  color:Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        children: createWidget()
                    ),
                  )
              ),
            );
          },
        )
    );
  }

  List<Widget> createWidget() {
    log("createWidget $isChangable");
    List<Widget> widgetList = [];
    for (var element in widgetDataList) {
      var widget = WidgetFactory.create(element.key, element.size);
      widgetList.add(widget);
    }
    return widgetList;
  }
}