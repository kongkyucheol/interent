import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({Key? key}) : super(key: key);

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {

  bool lightTheme = true;
  Color currentColor = Colors.greenAccent;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = useWhiteForeground(currentColor)
        ? Colors.white
        : Colors.black;
    return AnimatedTheme(
      data: ThemeData.light(),
      child: Builder(builder: (context) {
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
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

            },),
        );
      }),
    );
  }
}