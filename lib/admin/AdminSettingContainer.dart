import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet/admin/AdminSettingStateWidget.dart';
import 'package:internet/admin/AdminSettingViewModel.dart';
import 'package:provider/provider.dart';

class AdminSettingContainer extends StatelessWidget{
  const AdminSettingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<AdminSettingViewModel>(
        create:(context) =>AdminSettingViewModel(),
        child: const AdminSettingStateWidget()
      )
    );
  }

}