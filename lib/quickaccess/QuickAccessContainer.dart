import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:internet/NavigatorWrapper.dart';

import 'QuickAccessGridWidget.dart';

class QuickAccessContainer extends StatelessWidget {
  const QuickAccessContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorWrapper navigatorWrapper = NavigatorWrapper();
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () { navigatorWrapper.go('/setting'); },
        child: const Text("설정"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,

      body: const QuickAccessGridWidget(),
    );
  }

}