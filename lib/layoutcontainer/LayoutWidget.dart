
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet/NavigatorWrapper.dart';
import 'package:internet/layoutcontainer/LayoutViewModel.dart';
import 'package:internet/layoutcontainer/WidgetData.dart';
import 'package:internet/wallpaper/WallpaperSource.dart';
import 'package:provider/provider.dart';
import 'WidgetFactory.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';

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
  //https://pub.dev/packages/drag_and_drop_lists
  late List<DragAndDropList> _contents;
  late List<WidgetData> widgetDataList;

  void setContents() {
    _contents = List.generate(3, (index) {
      return DragAndDropList(
          header:const Text("DRAG AND DROP"),
          children: createDragAndDroItem()
      );
    });
  }

  Widget makeWallpaperColor() {
    WallpaperSource wallpaperSource = WallpaperSource();
    return Scaffold(
        body: Consumer<LayoutViewModel> (
          builder: (BuildContext context, LayoutViewModel value, Widget? child){
            widgetDataList = value.widgetData;
            return MaterialApp(
              title: 'Internet FirstPage',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: Container(
                  color:wallpaperSource.getColor(),
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

  Widget makeWallpaper() {
    WallpaperSource wallpaperSource = WallpaperSource();
    if(wallpaperSource.platformFile == null || wallpaperSource.platformFile!.bytes == null) {
      log("makeWallpaperColor");
      return makeWallpaperColor();
    }
    log("makeWallpaperFile");
    return Scaffold(
        body: Consumer<LayoutViewModel> (
          builder: (BuildContext context, LayoutViewModel value, Widget? child){
            widgetDataList = value.widgetData;
            return MaterialApp(
              title: 'Internet FirstPage',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: Container(
                decoration: BoxDecoration(image: DecorationImage(image:MemoryImage(wallpaperSource.platformFile!.bytes!))),
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

  @override
  Widget build(BuildContext context) {
    log("Layoutwidget build $isChangable");
    return makeWallpaper();

  }

  _onItemReorder(int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    log("_onItemReorder");
    setState(() {
      var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
      _contents[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    log("_onListReorder");

    setState(() {
      var movedList = _contents.removeAt(oldListIndex);
      _contents.insert(newListIndex, movedList);
    });
  }

  List<DragAndDropItem> createDragAndDroItem() {
    log("createDragAndDroItem");
    List<DragAndDropItem> widgetList = [];
    for (var element in widgetDataList) {
      var widget = Text(element.key);
      widgetList.add(DragAndDropItem(child: widget));
    }
    return widgetList;
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