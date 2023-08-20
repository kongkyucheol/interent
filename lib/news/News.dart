
class News {
  String label="";
  String description="";
  String iconUri="";
  String actionUri="";

  @override
  String toString() {
    // TODO: implement toString
    return "News:${label}, ${description}, $iconUri";
  }
}