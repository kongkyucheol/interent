import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:internet/admin/AdminSettingRepo.dart';

import 'AdminData.dart';

class AdminSettingViewModel with ChangeNotifier {
  late AdminSettingRepo _adminSettingRepo;
  List<AdminData> _adminDataList = List.empty(growable: true);
  List<AdminData> get adminDataList => _adminDataList;

  AdminSettingViewModel() {
    _adminSettingRepo = AdminSettingRepo();
    _getAdminList();
  }

  Future<void> _getAdminList() async{
    _adminDataList = await _adminSettingRepo.getAdminDataList();
    notifyListeners();
  }

  void update(List<AdminData> adminDataList) {
    _adminDataList = adminDataList;
    _adminSettingRepo.update(_adminDataList);
  }

  Future<void> upload(String json) async{
    if(json == null) {
      log("upload() error!");
      return;
    }
    await _adminSettingRepo.upload(json);
    _getAdminList();
  }
}