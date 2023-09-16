
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

  Future<void> upload(String json) async{
    await _newsSettingResource.upload(json);
  }
}