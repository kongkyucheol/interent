import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:internet/wallpaper/WallpaperSource.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({Key? key}) : super(key: key);

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {

  bool lightTheme = true;
  WallpaperSource wallpaperSource = WallpaperSource();
  Color currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    currentColor = Color(wallpaperSource.getColor());
    final foregroundColor = Colors.white;
    return AnimatedTheme(
      data: ThemeData.light(),
      child: Builder(builder: (context) {
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              wallpaperSource.setColor(currentColor);
            },
            icon: Icon(Icons.settings),
            label: const Text('apply'),
            backgroundColor: currentColor,
            foregroundColor: foregroundColor,
            elevation: 15,
          ),
          appBar: AppBar(
            title: const Text('Color Picker'),
            foregroundColor: foregroundColor,
          ),
          body: ColorPicker(
            pickerColor: currentColor,
            onColorChanged: (Color value) {
              currentColor = value;
            },),
        );
      }),
    );
  }
}