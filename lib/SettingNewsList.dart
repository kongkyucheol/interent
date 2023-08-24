import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  DemoState createState() => new DemoState();
}

class DemoState extends State<Demo> {
  Map<String, bool> values = {
    'CNN News             expiration=1h': true,
    'BBC News              expiration=2h': false,
    '매일 경제              expiration=3h': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: new Text('Admin News')),
      body: ListView(
        children: values.keys.map((String key) {
          return  CheckboxListTile(
            title:  Text(key),
            value: values[key],
            onChanged: (bool? value) {
              setState(() {
                values[key] = true;
              });
            },
          );

        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(home: new Demo(), debugShowCheckedModeBanner: false));
}