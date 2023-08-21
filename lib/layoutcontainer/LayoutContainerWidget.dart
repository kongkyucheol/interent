
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet/layoutcontainer/LayoutViewModel.dart';
import 'package:internet/layoutcontainer/WidgetData.dart';
import 'package:provider/provider.dart';

//https://totally-developer.tistory.com/115 참고.
class LayoutContainerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LayoutContainerState();
}

class _LayoutContainerState extends State<LayoutContainerWidget> {
  late List<WidgetData> widgetList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("test internet"),),
      body: Consumer<LayoutViewModel> (
        builder: (BuildContext context, LayoutViewModel value, Widget? child){
          widgetList = value.widgetData;
          return ListView.builder(
              itemCount: widgetList.length,
              itemBuilder: (context,index) {
                return Container(
                  child: Text("sdf"),
                );
          });
        },

      )
    );
  }

}