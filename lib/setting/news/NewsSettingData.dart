class NewsSettingData {
  NewsSettingData({this.key="", this.title="", this.urlType="", this.valid=true});
  String key = "";
  String title = "";
  String urlType = "";
  int validTime = 60;
  bool valid = true;
  bool checked = true;
  String url="";

  Map<String, dynamic> toJson() =>{
    'key':key,
    'title':title,
    'urlType':urlType,
    'valid_time':validTime,
    'valid':valid
  };
}
