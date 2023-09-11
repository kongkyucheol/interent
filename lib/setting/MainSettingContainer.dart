import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet/NavigatorWrapper.dart';
import 'package:internet/wallpaper/WallpaperSource.dart';
import 'MainSettingWidget.dart';

class MainSettingContainer extends StatelessWidget {
  MainSettingContainer({Key? key}) : super(key: key);

  WallpaperSource wallpaperSource = WallpaperSource();
  NavigatorWrapper navigatorWrapper = NavigatorWrapper();

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
                          var picked = await FilePicker.platform.pickFiles(type:FileType.image);
                          if(picked != null) {
                            wallpaperSource.setWallpaperFile(picked.files.first);
                          }
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