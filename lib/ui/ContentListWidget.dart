import 'package:flutter/material.dart';
import 'ContentListItemWidget.dart';
import 'repository/ContentRepository.dart';

class ContentListWidget extends StatefulWidget {
  final List<Content>? contents;

  const ContentListWidget({Key? key, this.contents}) :
        super(key: key);


  @override
  State<StatefulWidget> createState() => _ContentListState();
}

class _ContentListState extends State<ContentListWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: widget.contents!.map((Content content){
                  return ContentListItemWidget(content);
                  }).toList()
      )
    );

  }

}