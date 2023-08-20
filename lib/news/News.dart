
class News {
  String label="";
  String description="";
  String iconUri="";
  String actionUri="";
  int datetime = 0;

  @override
  String toString() {
    // TODO: implement toString
    return "News:${label}, ${description}, $iconUri";
  }
}