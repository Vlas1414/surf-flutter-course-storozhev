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
      appBar: const CustomAppBar(Strings.appMainTitle),
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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  static const double _prefferredHeight = 170;

  const CustomAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _prefferredHeight,
      padding: const EdgeInsets.all(16),
      alignment: Alignment.bottomLeft,
      child: Text(
        title,
        style: Styles.appMainTitle,
        maxLines: 2,
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, _prefferredHeight);
}
