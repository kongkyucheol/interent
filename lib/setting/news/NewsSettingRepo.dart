
import 'NewsSettingData.dart';
import 'NewsSettingSource.dart';

class NewsSettingRepo {
  final _newsSettingResource = NewsSettingSource();

  Future<List<NewsSettingData>> getNewsDataList() async{
    return _newsSettingResource.getNewsSettingDataList();
  }

  void update(List<NewsSettingData> newsSettingDataList) {
    _newsSettingResource.update(newsSettingDataList);
  }

}