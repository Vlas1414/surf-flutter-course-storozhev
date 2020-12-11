import 'package:flutter/material.dart';
import 'package:places/strings.dart';
import 'package:places/styles.dart';

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
            style: Styles.APP_MAIN_TITLE,
            children: [
              TextSpan(
                  text: 'С',
                  style:
                      TextStyle(color: Color.fromARGB(255, 76, 175, 80))),
              TextSpan(text: 'писок\n'),
              TextSpan(
                  text: 'И',
                  style:
                      TextStyle(color: Color.fromARGB(255, 252, 221, 61))),
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
