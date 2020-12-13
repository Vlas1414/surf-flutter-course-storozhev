import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

import 'package:places/mocks.dart';
import 'package:places/strings.dart';
import 'package:places/styles.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            Strings.APP_MAIN_TITLE,
            style: Styles.APP_MAIN_TITLE,
            textAlign: TextAlign.left,
            maxLines: 2,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: mocks.map((element) => SightCard(sight: element)).toList(),
        ),
      ),
    );
  }
}
