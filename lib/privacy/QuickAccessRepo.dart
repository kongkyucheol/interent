
import 'dart:developer';

import '../quickaccess/QuickAccessData.dart';
import 'package:favicon/favicon.dart';

class QuickAccessRepo {

  Future<List<QuickAccessData>> getNews() async {
    log('getNews()');
    var iconUrl = await FaviconFinder.getBest('https://stackoverflow.com/');
    return List.empty();
  }

}
