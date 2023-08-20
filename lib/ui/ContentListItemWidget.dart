import 'package:flutter/material.dart';
import 'dart:developer';
import 'repository/ContentRepository.dart';

class ContentListItemWidget extends StatelessWidget {
  final Content content;

  ContentListItemWidget(this.content)
      : super(key: ObjectKey(content));

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){ log('onclick ${content!.label}');},
      title: Text(content!.label)
    );
  }
  
}