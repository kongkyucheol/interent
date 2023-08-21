

import 'package:internet/news/NewsData.dart';

abstract class NewsRepo {

  Future<List<NewsData>> getNews();
}
