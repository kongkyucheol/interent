import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internet/admin/AdminSettingViewModel.dart';
import 'package:provider/provider.dart';

import 'AdminData.dart';

class AdminSettingStateWidget extends StatefulWidget {
  const AdminSettingStateWidget({Key? key}) : super(key: key);

  @override
  AdminSettingState createState() => AdminSettingState();
}

class AdminSettingState extends State<AdminSettingStateWidget> {
  late List<AdminData> adminDataList;

  @override
  Widget build(BuildContext context) {
    log("AdminSettingStateWidget");

    return Consumer<AdminSettingViewModel>(
            builder: (context, provider, child) {
          adminDataList = provider.adminDataList;
          return ListView.builder(
            itemCount: adminDataList.length,
            itemBuilder: (context, index) {
              return Card(
                child:CheckboxListTile(
                  title:Text(adminDataList[index].title),
                  value:adminDataList[index].valid,
                  onChanged: (val) {
                    setState(() {
                      adminDataList[index].valid = val!;
                      log("AdminSettingStateWidget $val");
                      provider.update(adminDataList);
                    });
                  },

                )
              );
            },
          );
        });

  }
}