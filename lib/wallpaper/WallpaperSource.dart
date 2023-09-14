import 'dart:developer';
import 'dart:html';
import 'package:flutter/material.dart';

class WallpaperSource {
  WallpaperSource._privateConstructor();
  static final WallpaperSource _instance = WallpaperSource._privateConstructor();


  factory WallpaperSource() {
    return _instance;
  }
  File? file;
  Color color = Colors.white;



  void setWallpaperFile(File? platformFile) {
    log("setWallpaperFile: ${platformFile.toString()}");
    this.file = platformFile;
    color = Colors.transparent;
  }

  File? getWallpaperFile() {
    return file;
  }

  void setColor(Color color) {
    log("setColor 0x${color.value.toRadixString(16)}");
    this.color = color;
    file = null;
  }

  Color getColor() {
    return color;
  }
}