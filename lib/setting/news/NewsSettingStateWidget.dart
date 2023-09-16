import 'dart:developer';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'NewsSettingData.dart';
import 'dart:html' as html;
import 'NewsSettingViewModel.dart';

class NewsSettingStateWidget extends StatefulWidget {
  const NewsSettingStateWidget({Key? key}) : super(key: key);

  @override
  NewsSettingState createState() => NewsSettingState();
}

class NewsSettingState extends State<NewsSettingStateWidget> {
  late List<NewsSettingData> newsDataList;

  @override
  Widget build(BuildContext context) {
    log("NewsSettingState");

    return Consumer<NewsSettingViewModel>(
            builder: (context, provider, child) {
          newsDataList = provider.newsDataList;
          return ListView.builder(
            itemCount: newsDataList.length + 1,
            itemBuilder: (context, index) {
              if(index == newsDataList.length) {
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
                  title:Text(newsDataList[index].title),
                  value:newsDataList[index].valid,
                  onChanged: (val) {
                    setState(() {
                      newsDataList[index].valid = val!;
                      log("NewsSettingStateWidget $val");
                      provider.update(newsDataList);
                    });
                  },

                )
              );
            },
          );
        });
  }
  FileReader reader = FileReader();

  void onLoaded(NewsSettingViewModel provider) async{
    log("onLoaded() START");
    await provider.upload(reader.result as String);
    // setState(() {
    //   log("onLoaded()END");
    // });

  }
}