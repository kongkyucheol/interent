
import 'dart:developer';

import 'Shortcut.dart';
import 'package:favicon/favicon.dart';

class ShortcutRepo {

  Future<List<Shortcut>> getNews() async {
    log('getNews()');
    var iconUrl = await FaviconFinder.getBest('https://stackoverflow.com/');
    return List.empty();
  }

}
