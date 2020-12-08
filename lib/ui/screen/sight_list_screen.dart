import 'package:flutter/material.dart';
import 'package:places/utils.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            //Список\nинтересных мест
            style: TextStyle(
              color: Utils().convertHexToColor('#3B3E5B'),
              fontFamily: 'RobotoRegular',
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
            children: [
              TextSpan(
                  text: 'С',
                  style:
                      TextStyle(color: Utils().convertHexToColor('#4CAF50'))),
              TextSpan(text: 'писок\n'),
              TextSpan(
                  text: 'И',
                  style:
                      TextStyle(color: Utils().convertHexToColor('#FCDD3D'))),
              TextSpan(text: 'нтересных мест'),
            ],
          ),
          textAlign: TextAlign.left,
          maxLines: 2,
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}
