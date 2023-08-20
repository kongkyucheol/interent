
import 'News.dart';

abstract class NewsRepo {

  Future<List<News>> getNews();
}
