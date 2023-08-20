
import 'dart:developer';
import 'dart:html';

import 'package:favicon/favicon.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:url_launcher/url_launcher.dart';

class ShortcutItemWidget extends StatefulWidget {

  final String uri;
  const ShortcutItemWidget({Key? key, required this.uri}): super(key: key);

  @override
  State<StatefulWidget> createState() => _ShortcutItemWidgetState(this.uri);
}

class _ShortcutItemWidgetState extends State<ShortcutItemWidget> {

  String iconUrl = "";

  _ShortcutItemWidgetState(String uri) {
    iconUrl = uri;
  }
  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    log("load ${this.iconUrl}");
    var iconUrl = await FaviconFinder.getBest(this.iconUrl);
    setState(() {
      this.iconUrl = iconUrl?.url??"";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: buildImageWidgete()
    );
    return buildImageWidgete();
  }

  Widget buildImageWidgete() {
    String imageUrl = iconUrl;
    // https://github.com/flutter/flutter/issues/41563
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        imageUrl,
            (int viewId) => ImageElement()
          ..src = imageUrl
          ..id = imageUrl
          ..width = 50
          ..height = 50
          ..onClick.listen((event) {gotoPage();})

    );
    return HtmlElementView(
      key: UniqueKey(),
      viewType: imageUrl,
    );
  }
  //
  Future<void> gotoPage() async {
    if (!await launchUrl(Uri.parse(iconUrl), webOnlyWindowName: '_self')) {
    throw Exception('Could not launch ${iconUrl}');
    }
  }
}