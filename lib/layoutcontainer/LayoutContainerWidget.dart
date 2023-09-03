
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet/layoutcontainer/LayoutViewModel.dart';
import 'package:internet/layoutcontainer/LayoutWidget.dart';
import 'package:provider/provider.dart';

//https://totally-developer.tistory.com/115 참고.
class LayoutContainerWidget extends StatelessWidget {
  var isSetting = false;

  LayoutContainerWidget({Key? key}) : super(key: key){
    final Uri uri = Uri.base;
    //final String url = Uri.base.toString();
    isSetting = uri.queryParameters['setting']?.toLowerCase() == "true";
    log("LayoutContainerWidget $isSetting");

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<LayoutViewModel>(
        create: (context) => LayoutViewModel(),
        child: LayoutWidget(isSetting),
      ),
    );
  }
}