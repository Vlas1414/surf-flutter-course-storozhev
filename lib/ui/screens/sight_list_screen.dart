import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/constants/stringsApp.dart';
import 'package:places/constants/textStylesApp.dart';
import 'package:places/ui/components/sight_card.dart';
import 'package:places/ui/utils/default_bottom_navigaion_bar.dart';
import 'package:places/ui/utils/default_list_view.dart';

/// Экран списка интересных мест.
class SightListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _CustomAppBar(StringsApp.appMainTitle),
      body: DefaultListView.simpleList(
        mocksSights
            .map(
              (element) => SightCard.simple(element),
            )
            .toList(),
      ),
      bottomNavigationBar: DefaultBottomNavigationBar(),
    );
  }
}

/// AppBar для экрана списка интересных мест.
/// title - заголовок
class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  static const double _prefferredHeight = 160;

  const _CustomAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _prefferredHeight,
      padding: const EdgeInsets.only(bottom: 5, left: 16, right: 16),
      alignment: Alignment.bottomLeft,
      child: Text(
        title,
        style: TextStylesApp.size32WeightBold.copyWith(
          color: Theme.of(context).textTheme.bodyText1.color,
        ),
        maxLines: 2,
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, _prefferredHeight);
}
