import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

enum WallpaperType {
  WALLPAPER_COLOR, WALLPAPER_FILE
}

class WallpaperSource {
  WallpaperSource._privateConstructor();
  static final WallpaperSource _instance = WallpaperSource._privateConstructor();


  factory WallpaperSource() {
    return _instance;
  }
  WallpaperType type = WallpaperType.WALLPAPER_COLOR;
  PlatformFile? platformFile;
  Color color = Colors.white;



  void setWallpaperFile(PlatformFile platformFile) {
    log("setWallpaperFile: ${platformFile.toString()}");
    this.platformFile = platformFile;
    type = WallpaperType.WALLPAPER_FILE;
  }

  String? getWallpaperFile() {
    return platformFile?.name;
  }

  void setColor(Color color) {
    log("setColor 0x${color.value.toRadixString(16)}");
    this.color = color;
    type = WallpaperType.WALLPAPER_COLOR;
  }

  Color getColor() {
    return color;
  }
}