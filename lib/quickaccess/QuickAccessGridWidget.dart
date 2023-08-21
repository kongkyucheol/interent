import 'dart:developer';
import 'package:flutter/material.dart';

import 'QuickAccessData.dart';
import 'QuickAccessWidget.dart';
import '../privacy/QuickAccessRepo.dart';


class QuickAccessGridWidget extends StatefulWidget {
  const QuickAccessGridWidget({Key? key}) :
        super(key: key);

  @override
  State<StatefulWidget> createState() => _QuickAccessGridWidgetState();
}

class _QuickAccessGridWidgetState extends State<QuickAccessGridWidget> {
  var shortcutList = [
    "https://www.google.com",
    "https://www.naver.com",
    "https://www.yahoo.com",
    "https://youtube.com",
    "https://facebook.com",
    "https://twitter.com",
    "https://openai.com"
  ];
  QuickAccessRepo shortcutRepo = QuickAccessRepo();

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
            return QuickAccessWidget(uri: shortcutList[itemIndex]);
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