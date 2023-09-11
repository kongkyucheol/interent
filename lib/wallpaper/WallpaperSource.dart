import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class WallpaperSource {
  WallpaperSource._privateConstructor();
  static final WallpaperSource _instance = WallpaperSource._privateConstructor();

  factory WallpaperSource() {
    return _instance;
  }
  String fileUri = "";
  int color = 0xFFFFFF;
  void setWallpaperFile(PlatformFile platformFile) {
    log("setWallpaperFile: ${platformFile.path}");
    fileUri = '${platformFile.path!}/${platformFile.name}';
  }

  String getWallpaperFile() {
    return fileUri;
  }

  void setColor(Color color) {
    this.color = color.value;
  }

  int getColor() {
    return color;
  }


}