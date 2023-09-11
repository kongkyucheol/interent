import 'dart:developer';

import 'package:file_picker/file_picker.dart';

class WallpaperSource {
  WallpaperSource._privateConstructor();
  static final WallpaperSource _instance = WallpaperSource._privateConstructor();

  factory WallpaperSource() {
    return _instance;
  }
  PlatformFile? platformFile;
  void setWallpaperFile(PlatformFile platformFile) {
    log("setWallpaperFile: ${platformFile.path}");
    this.platformFile = platformFile;
  }

  PlatformFile? getWallpaperFile() {
    return platformFile;
  }
}