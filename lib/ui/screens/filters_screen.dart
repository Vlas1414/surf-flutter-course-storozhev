import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/assetsApp.dart';
import 'package:places/constants/colorsApp.dart';
import 'package:places/constants/stringsApp.dart';
import 'package:places/constants/textStylesApp.dart';
import 'package:places/ui/utils/default_accept_button.dart';
import 'package:places/ui/utils/default_app_bar.dart';

/// Элемент категории
/// text - имя категории
/// icon - иконка категории
/// isChecked - выбрана ли категория
class Category {
  Category({
    @required this.text,
    @required this.icon,
    this.isChecked = false,
  });

  final String text;
  final String icon;
  bool isChecked;
}

/// Экран настройки фильтра
class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final List<Category> categories = [
    Category(
      text: StringsApp.filterHotel,
      icon: AssetsApp.hotelIcon,
    ),
    Category(
      text: StringsApp.filterRestaurant,
      icon: AssetsApp.restaurantIcon,
    ),
    Category(
      text: StringsApp.filterParticularPlace,
      icon: AssetsApp.particularPlaceIcon,
    ),
    Category(
      text: StringsApp.filterPark,
      icon: AssetsApp.parkIcon,
    ),
    Category(
      text: StringsApp.filterMuseum,
      icon: AssetsApp.museumIcon,
    ),
    Category(
      text: StringsApp.filterCafe,
      icon: AssetsApp.cafeIcon,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        leading: Image.asset(
          AssetsApp.arrowIcon,
          width: 24,
          height: 24,
          color: Theme.of(context).textTheme.headline1.color,
        ),
        action: Text(
          StringsApp.filterClear,
          style: TextStylesApp.size18.copyWith(
            color: ColorsApp.green,
          ),
        ),
        onTapAction: () {
          setState(() {
            categories.asMap().forEach((index, value) {
              categories[index].isChecked = false;
            });
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _MyFilter(
              categories: categories,
              onCheckItem: (int index) {
                setState(() {
                  categories[index].isChecked = !categories[index].isChecked;
                });
              },
            ),
            _MyRangeSlider(),
          ],
        ),
      ),
    );
  }
}

class _MyFilter extends StatelessWidget {
  _MyFilter({
    @required this.categories,
    @required this.onCheckItem,
  });

  final List<Category> categories;
  final Function(int) onCheckItem;

  @override
  Widget build(BuildContext context) {
    final List<Widget> categoriesToShow = [];
    categories.asMap().forEach(
          (index, value) => categoriesToShow.add(
            _FilterItem(
              text: categories[index].text,
              iconName: categories[index].icon,
              isChecked: categories[index].isChecked,
              onTap: () => onCheckItem(index),
            ),
          ),
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsApp.filterCategories.toUpperCase(),
          style: TextStylesApp.size14.copyWith(
            color: ColorsApp.inactiveBlack,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 25),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            children: categoriesToShow,
          ),
        ),
      ],
    );
  }
}

class _FilterItem extends StatelessWidget {
  _FilterItem({
    this.text,
    this.iconName,
    this.isChecked,
    this.onTap,
  });

  final Function onTap;
  final bool isChecked;
  final String iconName;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          radius: 100,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          onTap: onTap,
          child: Stack(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  color: ColorsApp.green.withAlpha(50),
                ),
                child: UnconstrainedBox(
                  child: Image.asset(
                    iconName,
                    width: 32,
                    color: ColorsApp.green,
                  ),
                ),
              ),
              isChecked
                  ? Positioned(
                      right: 0,
                      bottom: -4,
                      child: Image.asset(
                        AssetsApp.tickChoiceIcon,
                        width: 24,
                      ),
                    )
                  : null
            ].where((e) => e != null).toList(),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: TextStylesApp.size14.copyWith(
            color: ColorsApp.secondary,
          ),
        ),
      ],
    );
  }
}

class _MyRangeSlider extends StatefulWidget {
  @override
  _MyRangeSliderState createState() => _MyRangeSliderState();
}

class _MyRangeSliderState extends State<_MyRangeSlider> {
  RangeValues _rangeValues = RangeValues(100, 5000);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringsApp.filterDistance,
                    style: TextStylesApp.size16.copyWith(
                      color: Theme.of(context).textTheme.bodyText1.color,
                    ),
                  ),
                  Text(
                    "${StringsApp.filterFrom} ${_rangeValues.start ~/ 1000} ${StringsApp.filterTo.toLowerCase()} ${_rangeValues.end ~/ 1000} ${StringsApp.filterKm}",
                    style: TextStylesApp.size16.copyWith(
                      color: ColorsApp.secondary2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 2,
                  thumbColor: ColorsApp.white,
                  activeTrackColor: ColorsApp.green,
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 0.0),
                ),
                child: RangeSlider(
                  inactiveColor: ColorsApp.inactiveBlack,
                  values: _rangeValues,
                  min: 100.0,
                  max: 10000.0,
                  onChanged: (RangeValues newValues) {
                    setState(() {
                      _rangeValues = newValues;
                    });
                  },
                ),
              ),
            ],
          ),
          DefaultAcceptButton(
            text: StringsApp.filterShowBtn + ' (190)',
          ),
        ],
      ),
    );
  }
}
