class Content {
  final String label;
  final Uri imageUri;
  final Uri actionUri;
  const Content(this.label, this.imageUri, this.actionUri);
}

class ContentRepository {
  List<Content> getContentList() {
    return [
      Content("test1", Uri.parse("https://pub.dev/static/hash-il7e9372/img/pub-dev-logo-2x.png"), Uri.parse("https://pub.dev/packages/image")),
      Content("test2", Uri.parse("https://pub.dev/static/hash-il7e9372/img/pub-dev-logo-2x.png"), Uri.parse("https://pub.dev/packages/image")),
      Content("test3", Uri.parse("https://pub.dev/static/hash-il7e9372/img/pub-dev-logo-2x.png"), Uri.parse("https://pub.dev/packages/image")),
      Content("test4", Uri.parse("https://pub.dev/static/hash-il7e9372/img/pub-dev-logo-2x.png"), Uri.parse("https://pub.dev/packages/image")),
      Content("test5", Uri.parse("https://pub.dev/static/hash-il7e9372/img/pub-dev-logo-2x.png"), Uri.parse("https://pub.dev/packages/image")),
      Content("test6", Uri.parse("https://pub.dev/static/hash-il7e9372/img/pub-dev-logo-2x.png"), Uri.parse("https://pub.dev/packages/image")),
      Content("test7", Uri.parse("https://pub.dev/static/hash-il7e9372/img/pub-dev-logo-2x.png"), Uri.parse("https://pub.dev/packages/image")),
      Content("test8", Uri.parse("https://pub.dev/static/hash-il7e9372/img/pub-dev-logo-2x.png"), Uri.parse("https://pub.dev/packages/image")),
      Content("test9", Uri.parse("https://pub.dev/static/hash-il7e9372/img/pub-dev-logo-2x.png"), Uri.parse("https://pub.dev/packages/image")),
      Content("test10", Uri.parse("https://pub.dev/static/hash-il7e9372/img/pub-dev-logo-2x.png"), Uri.parse("https://pub.dev/packages/image")),
      Content("test11", Uri.parse("https://pub.dev/static/hash-il7e9372/img/pub-dev-logo-2x.png"), Uri.parse("https://pub.dev/packages/image")),
    ];
  }
}


