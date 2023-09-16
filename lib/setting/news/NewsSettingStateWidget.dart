import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:internet/NavigatorWrapper.dart';
import 'package:provider/provider.dart';
import 'NewsSettingData.dart';
import 'NewsSettingViewModel.dart';

class NewsSettingStateWidget extends StatefulWidget {
  const NewsSettingStateWidget({Key? key}) : super(key: key);

  @override
  NewsSettingState createState() => NewsSettingState();
}

class NewsSettingState extends State<NewsSettingStateWidget> {
  late List<NewsSettingData> newsDataList;

  NavigatorWrapper navigatorWrapper = NavigatorWrapper();
  @override
  Widget build(BuildContext context) {
    log("NewsSettingState");

    return Consumer<NewsSettingViewModel>(
            builder: (context, provider, child) {
          newsDataList = provider.newsDataList;
          return ListView.builder(
            itemCount: newsDataList.length+1,
            itemBuilder: (context, index) {
              if(index == newsDataList.length) {
                return TextButton(onPressed:(){
                      navigatorWrapper.go(NavigatorWrapper.ROOT);
                    }, child: const Text("APPLY"),);
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
}