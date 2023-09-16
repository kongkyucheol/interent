
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'NewsSettingStateWidget.dart';
import 'NewsSettingViewModel.dart';

class NewsSettingContainer extends StatelessWidget{
  const NewsSettingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<NewsSettingViewModel>(
        create:(context) =>NewsSettingViewModel(),
        child: const NewsSettingStateWidget()
      )
    );
  }

}