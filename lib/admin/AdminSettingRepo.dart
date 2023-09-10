import 'package:internet/admin/AdminData.dart';
import 'package:internet/admin/AdminSettingSource.dart';

class AdminSettingRepo {
  final _adminSettingResource = AdminSettingSource();

  Future<List<AdminData>> getAdminDataList() async{
    return _adminSettingResource.getAdminDataList();
  }

  void update(List<AdminData> adminDataList) {
    _adminSettingResource.update(adminDataList);
  }
}