import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class WallpaperSource {
  WallpaperSource._privateConstructor();
  static final WallpaperSource _instance = WallpaperSource._privateConstructor();

  factory WallpaperSource() {
    return _instance;
  }
  PlatformFile? platformFile;
  int color = Colors.blue.value;
  void setWallpaperFile(PlatformFile platformFile) {
    log("setWallpaperFile: ${platformFile.toString()}");
    this.platformFile = platformFile;
  }

  String? getWallpaperFile() {
    return platformFile?.name;
  }

  void setColor(Color color) {
    log("setColor 0x${color.value.toRadixString(16)}");
    this.color = color.value;
  }

  int getColor() {
    return color;
  }
}