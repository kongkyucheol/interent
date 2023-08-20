
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Shortcut.dart';
import 'dart:ui' as ui;

class ShortcutItemWidget extends StatelessWidget {

  final Shortcut news;
  ShortcutItemWidget(this.news)
      : super(key: ObjectKey(news)) {
  }

  Widget buildImageWidgete(BuildContext context) {
      String imageUrl = news.actionUri;
      return HtmlElementView(
        key: UniqueKey(),
        viewType: imageUrl,
      );
  }

  Future<void> gotoPage() async {
    log("gotoPage(${news.actionUri})");
    if (!await launchUrl(Uri.parse(news.actionUri), webOnlyWindowName: '_self')) {
    throw Exception('Could not launch ${news.actionUri}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => gotoPage(),
        child:SizedBox(
        width: 500,
        child: Row(
          children: <Widget>[
            Expanded(flex:1, child:
              SizedBox(
                height: 70,
                width: 70,
                child: buildImageWidgete(context),
              )
            ),

            Expanded(flex:9,
                child: Text(news.actionUri),
            ),
          ],
        ),


    ));
  }

}