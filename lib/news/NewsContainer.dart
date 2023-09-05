import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NewsListWidget.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewsListWidget();
  }

}