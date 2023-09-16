import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'NewsSettingData.dart';
import 'NewsSettingRepo.dart';

class NewsSettingViewModel with ChangeNotifier {
  late NewsSettingRepo _newsSettingRepo;
  List<NewsSettingData> _newsDataList = List.empty(growable: true);
  List<NewsSettingData> get newsDataList => _newsDataList;

  NewsSettingViewModel() {
    _newsSettingRepo = NewsSettingRepo();
    _getNewsList();
  }

  Future<void> _getNewsList() async{
    _newsDataList = await _newsSettingRepo.getNewsDataList();
    notifyListeners();
  }

  void update(List<NewsSettingData> list) {
    _newsSettingRepo.update(list);
  }


}