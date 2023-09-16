import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';


class PrivacyWidget extends StatelessWidget {
  const PrivacyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20,),
        Text("이번 주 원하지 않는 리다이랙션 8개를 차단했습니다.",
          style: TextStyle(fontSize: 15, color:Colors.black,decoration: TextDecoration.none),
          textAlign: TextAlign.left,),
        SizedBox(height: 20,),
      ],
    );

  }


}
