import 'package:flutter/material.dart';
import 'package:places/customColors.dart';

import 'package:places/mocks.dart';
import 'package:places/strings.dart';
import 'package:places/styles.dart';
import 'package:places/ui/screen/sight_card.dart';

//экран списка интересных мест
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
        backgroundColor: CustomColors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            Strings.appMainTitle,
            style: Styles.appMainTitle,
            textAlign: TextAlign.left,
            maxLines: 2,
          ),
        ),
      ),
      backgroundColor: CustomColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: mocks
              .map(
                (element) => SightCard(sight: element),
              )
              .toList(),
        ),
      ),
    );
  }
}
