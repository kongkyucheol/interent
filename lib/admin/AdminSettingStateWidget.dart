import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:internet/admin/AdminSettingViewModel.dart';
import 'package:provider/provider.dart';

import 'AdminData.dart';
import 'dart:html' as html;

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
            itemCount: adminDataList.length + 1,
            itemBuilder: (context, index) {
              if(index == adminDataList.length) {
                return TextButton(onPressed:(){
                  final input = html.FileUploadInputElement()..accept = '*/*';
                  input.onChange.listen((event) {
                    if (input.files!.isNotEmpty) {
                      var file = input.files?.first;
                      reader.onLoadEnd.listen((event) {
                        onLoaded(provider);
                      });
                      reader.readAsText(file!);
                    }});
                  input.click();



                }, child: Text("CHANGE JSON"));
              }
              return Card(child:CheckboxListTile(
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
  FileReader reader = FileReader();

  void onLoaded(AdminSettingViewModel provider) async{
    log("onLoaded() START");
    await provider.upload(reader.result as String);
    // setState(() {
    //   log("onLoaded()END");
    // });

  }
}