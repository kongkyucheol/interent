import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:internet/news/NewsRepo.dart';

import 'Shortcut.dart';
import 'ShortcutItemWidget.dart';
import 'ShortcutRepo.dart';


class ShortcutListWidget extends StatefulWidget {
  const ShortcutListWidget({Key? key}) :
        super(key: key);

  @override
  State<StatefulWidget> createState() => _ShortcutListWidgetState();
}

class _ShortcutListWidgetState extends State<ShortcutListWidget> {
  List<Shortcut> shortcutList = [];
  ShortcutRepo shortcutRepo = ShortcutRepo();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Widget getBody() {
    bool showLoadingDialog = shortcutList.isEmpty;
    if(showLoadingDialog) {
      return getProgressDialog();
    }else {
      return getListView();
    }
  }

  Widget getProgressDialog() {
    return const Center(child:CircularProgressIndicator());
  }

  Widget getListView() {
    return ListView.builder(
      itemCount: shortcutList.length ,
      itemBuilder: (context, position) {
        return getRow(position);
      },
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ShortcutItemWidget(shortcutList[i]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody()
    );
  }

  Future<void> loadData() async {
    log('loadData()');
    var curNewList = await shortcutRepo.getNews();
    log('loadData() end: $curNewList');
    setState(() {
      shortcutList = curNewList;
    });
  }

}