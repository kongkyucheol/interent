import 'dart:developer';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:internet/news/NewsData.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;

class NewsListItemWidget extends StatelessWidget {

  final NewsData news;
  NewsListItemWidget(this.news)
      : super(key: ObjectKey(news)) {
  }

//flutter build web --release --web-renderer html
  Widget buildImageWidgete(BuildContext context) {
      String imageUrl = news.iconUri;
      // https://github.com/flutter/flutter/issues/41563
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        imageUrl,
            (int viewId) => ImageElement()
              ..src = imageUrl
              ..id=imageUrl
              ..width = 50
              ..height = 50
              ..onClick.listen((event) {gotoPage();})

      );
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
            // Expanded(flex:1, child:
            //   Image(
            //   image: NetworkImage(
            //     news.iconUri,
            //   ),height: 70, fit:BoxFit.fill,
            // )),
            Expanded(flex:2, child:
              SizedBox(
                height: 70,
                width: 70,
                child: buildImageWidgete(context),
              )
            ),

            Expanded(flex:9,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(news.description),
                ),
            ),
          ],
        ),


    ));
  }

}