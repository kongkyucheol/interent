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
              return Container(
                padding: const EdgeInsets.all(15),
                child: Text(adminDataList[index].key),
              );
            },
          );
        });

    return Scaffold(
        appBar: AppBar(title: const Text('Admin Setting')),
        body: Consumer<AdminSettingViewModel>(
            builder: (context, provider, child) {
          adminDataList = provider.adminDataList;
          return ListView.builder(
            itemCount: adminDataList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(15),
                child: Text(adminDataList[index].key),
              );
            },
          );
        })

        // body: ListView(
        //   children: values.keys.map((String key) {
        //     return  CheckboxListTile(
        //       title:  Text(key),
        //       value: values[key],
        //       onChanged: (bool? value) {
        //         setState(() {
        //           values[key] = true;
        //         });
        //       },
        //     );
        //
        //   }).toList(),
        // ),
        );
  }
}