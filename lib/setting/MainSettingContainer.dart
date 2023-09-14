import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet/NavigatorWrapper.dart';
import 'package:internet/wallpaper/WallpaperSource.dart';
import 'MainSettingWidget.dart';
import 'dart:html' as html;

class MainSettingContainer extends StatelessWidget {
  MainSettingContainer({Key? key}) : super(key: key);

  WallpaperSource wallpaperSource = WallpaperSource();
  NavigatorWrapper navigatorWrapper = NavigatorWrapper();

  void pickFile() {
    final input = html.FileUploadInputElement()..accept = 'image/*';
    input.onChange.listen((event) {
      if (input.files!.isNotEmpty) {
       var fileName = input.files?.first.name; // file name without path!
       wallpaperSource.setWallpaperFile(input.files?.first);
        // synthetic file path can be used with Image.network()
        var url = html.Url.createObjectUrl(input.files?.first);
        log("pickFile2:$fileName, ${input.files?.first}");
        navigatorWrapper.go(NavigatorWrapper.ROOT);
      }});
  input.click();
}
  @override
  Widget build(BuildContext context) {
    log("MainSettingContainer");
    navigatorWrapper.setContext(context);

    return MaterialApp(
      title: 'Setting',
      home: Scaffold(
        appBar: AppBar(title: const Text('Setting'),),
        body: Column(
              children: <Widget>[
                const Flexible(
                    flex:1, child: MainSettingWidget()),
                Flexible(flex:1,
                    child: TextButton(
                        onPressed:() async {
                          log("onPressed");
                          pickFile();
                          // var picked = await FilePicker.platform.pickFiles();
                          // if(picked != null) {
                          //   wallpaperSource.setWallpaperFile(picked.files.first);
                          //   navigatorWrapper.go(NavigatorWrapper.ROOT);
                          // }
                        },
                        child: const Text("Wallpaper File")
                    )
                ),
                Flexible(flex:1,
                    child: TextButton(
                        onPressed:() {navigatorWrapper.go('/color_picker');},
                        child: const Text("Wallpaper Colors")
                    )
                ),

              ],
            )
        )
      );
  }

}