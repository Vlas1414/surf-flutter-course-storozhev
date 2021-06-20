import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/assets_app.dart';
import 'package:places/constants/colors_app.dart';
import 'package:places/mocks.dart';
import 'package:places/constants/strings_app.dart';
import 'package:places/constants/text_styles_app.dart';
import 'package:places/ui/components/sight_card.dart';
import 'package:places/ui/screens/add_sight_screen.dart';
import 'package:places/ui/utils/default_bottom_navigaion_bar.dart';
import 'package:places/ui/utils/default_list_view.dart';
import 'package:places/ui/utils/search_bar.dart';

/// Экран списка интересных мест.
class SightListScreen extends StatelessWidget {
  const SightListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _CustomAppBar(
        StringsApp.appMainTitleFirst,
        StringsApp.appMainTitleSecond,
        SearchBar(),
      ),
      body: DefaultListView.simpleList(
        mocksSights
            .map(
              (element) => SightCard.simple(element),
            )
            .toList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const _AddSightButton(),
      bottomNavigationBar: const DefaultBottomNavigationBar(),
    );
  }
}

/// AppBar для экрана списка интересных мест.
/// title - заголовок
class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar(this.titleFirstPart, this.titleSecondPart, this.bottom,
      {Key? key})
      : super(key: key);

  final String titleFirstPart;
  final String titleSecondPart;
  final Widget? bottom;

  static const double _prefferredTitleHeight = 160;
  static const double _prefferredBottomHeight = 82;
  static const double _prefferredHeight =
      _prefferredBottomHeight + _prefferredTitleHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _prefferredHeight,
      padding: const EdgeInsets.only(bottom: 5, left: 16, right: 16),
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: Wrap(
              children: [
                Text(
                  '$titleFirstPart ',
                  style: TextStylesApp.size32WeightBold.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                  maxLines: 2,
                ),
                Text(
                  titleSecondPart,
                  style: TextStylesApp.size32WeightBold.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                  softWrap: false,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          if (bottom != null)
            Container(
              padding: const EdgeInsets.only(bottom: 6, top: 30),
              height: _prefferredBottomHeight,
              child: bottom,
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, _prefferredHeight);
}

/// Кнопка добавление нового места
class _AddSightButton extends StatelessWidget {
  const _AddSightButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void onPressed() {
      Navigator.push(
        context,
        CupertinoPageRoute<bool>(
          builder: (context) => const AddSightScreen(),
        ),
      );
    }

    return Container(
      width: 177,
      height: 48,
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(
          colors: [
            ColorsApp.yellow01,
            ColorsApp.green01,
          ],
          begin: FractionalOffset(-0.3, 0.0),
          end: FractionalOffset(1.3, 0.0),
        ),
      ),
      child: Material(
        color: ColorsApp.transparent,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
            width: 177,
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(
                    AssetsApp.plusIcon,
                  ),
                  width: 25,
                  height: 25,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  StringsApp.addSightTitle.toUpperCase(),
                  style: TextStylesApp.size14Weight700.copyWith(
                    color: ColorsApp.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
