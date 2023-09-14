class AdminData {
  AdminData({this.key="", this.title="", this.urlType="", this.valid=true});
  String key = "";
  String title = "";
  String urlType = "";
  int validTime = 60;
  bool valid = true;

  Map<String, dynamic> toJson() =>{
    'key':key,
    'title':title,
    'urlType':urlType,
    'valid_time':validTime,
    'valid':valid
  };
}
