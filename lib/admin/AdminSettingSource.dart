import 'dart:convert';

import '../Const.dart';
import 'AdminData.dart';
import 'package:http/http.dart' as http;

class AdminSettingSource {
  Future<List<AdminData>> getAdminDataList() async {
    final response = await http.get(Uri.parse(Const.BACK_END_URL));
    return jsonDecode(response.body);
  }
}