import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'QuickAccessGridWidget.dart';

class QuickAccessContainer extends StatelessWidget {
  const QuickAccessContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {  },
        child: const Text("DEL"),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,

      body: DottedBorder(
        borderType: BorderType.Rect,
        padding: const EdgeInsets.all(3),
        borderPadding: const EdgeInsets.all(3),
        child: const QuickAccessGridWidget(),
      ),
    );
  }

}