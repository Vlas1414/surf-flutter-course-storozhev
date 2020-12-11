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
                text: Strings.APP_MAIN_TITLE_FOR_RICH_TEXT_PART1,
                style: Styles.APP_MAIN_TITLE_SYMBOL1,
              ),
              TextSpan(
                text: Strings.APP_MAIN_TITLE_FOR_RICH_TEXT_PART2,
              ),
              TextSpan(
                text: Strings.APP_MAIN_TITLE_FOR_RICH_TEXT_PART3,
                style: Styles.APP_MAIN_TITLE_SYMBOL2,
              ),
              TextSpan(
                text: Strings.APP_MAIN_TITLE_FOR_RICH_TEXT_PART4,
              ),
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
