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
        title: Text(
          Strings.APP_MAIN_TITLE,
          textAlign: TextAlign.left,
          maxLines: 2,
          style: Styles.APP_MAIN_TITLE,
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}
