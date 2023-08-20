import 'dart:developer';
import 'package:flutter/material.dart';

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
  var shortcutList = [
    "https://www.google.com",
    "https://www.naver.com",
    "https://www.yahoo.com",
    "https://youtube.com",
    "https://facebook.com",
    "https://twitter.com",
    "https://openai.com"
  ];
  ShortcutRepo shortcutRepo = ShortcutRepo();

  @override
  void initState() {
    super.initState();
  }

  Widget getBody() {
    // bool showLoadingDialog = shortcutList.isEmpty;
    // if(showLoadingDialog) {
    //   return getProgressDialog();
    // }else {
    //   return getListView();
    // }
    return getListView();
  }

  Widget getProgressDialog() {
    return const Center(child:CircularProgressIndicator());
  }

  Widget getListView() {

    return GridView.builder(
              itemCount: 7, //item 개수
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, //1 개의 행에 보여줄 item 개수
              childAspectRatio: 1, //item 의 가로 1, 세로 2 의 비율
              mainAxisSpacing: 10, //수평 Padding
              crossAxisSpacing: 10, //수직 Padding
          ),
          itemBuilder: (BuildContext context, int itemIndex) {
          //item 의 반목문 항목 형성
            return ShortcutItemWidget(uri: shortcutList[itemIndex]);
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody()
    );
  }


}