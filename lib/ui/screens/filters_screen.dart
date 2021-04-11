import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/assets_app.dart';
import 'package:places/constants/colors_app.dart';
import 'package:places/constants/strings_app.dart';
import 'package:places/constants/text_styles_app.dart';
import 'package:places/domain/sight.dart';
import 'package:places/main.dart';
import 'package:places/mocks.dart';
import 'package:places/models/exception_model.dart';
import 'package:places/services/location_service.dart';
import 'package:places/ui/utils/default_accept_button.dart';
import 'package:places/ui/utils/default_app_bar.dart';
import 'package:provider/provider.dart';

/// Экран настроек фильтра
class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _CategoryModel()),
        ChangeNotifierProvider(
          create: (context) => _RangeModel()..getUserPosition(),
        ),
      ],
      child: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        leading: Image.asset(
          AssetsApp.arrowIcon,
          width: 24,
          height: 24,
          color: Theme.of(context).textTheme.headline1!.color,
        ),
        action: Text(
          StringsApp.filterClear,
          style: TextStylesApp.size18.copyWith(
            color: ColorsApp.green,
          ),
        ),
        onTapAction: () {
          Provider.of<_CategoryModel>(context, listen: false).uncheckAllItems();
          Provider.of<_RangeModel>(context, listen: false).makeDefaultValue();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _MyFilter(),
            _MyRangeSlider(),
            const Spacer(),
            _AcceptButton(),
          ],
        ),
      ),
    );
  }
}

class _MyFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          child: Consumer<_CategoryModel>(
            builder: (context, categoryModel, child) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                children: categoryModel.categories
                    .map(
                      (e) => _FilterItem(
                        text: e.text,
                        iconName: e.icon,
                        isChecked: e.isChecked,
                        onTap: () => categoryModel.onCheckItem(e),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _FilterItem extends StatelessWidget {
  const _FilterItem({
    this.text,
    this.iconName,
    this.isChecked,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final Function? onTap;
  final bool? isChecked;
  final String? iconName;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          onTap: onTap as void Function()?,
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
                    iconName!,
                    width: 32,
                    color: ColorsApp.green,
                  ),
                ),
              ),
              if (isChecked!)
                Positioned(
                  right: 0,
                  bottom: -4,
                  child: Image.asset(
                    Provider.of<ThemeModel>(context).isDarkMode
                        ? AssetsApp.tickChoiceWhiteIcon
                        : AssetsApp.tickChoiceIcon,
                    width: 24,
                  ),
                )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          text!,
          style: TextStylesApp.size14.copyWith(
            color: Theme.of(context).textTheme.headline1!.color,
          ),
        ),
      ],
    );
  }
}

class _MyRangeSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<_RangeModel>(
      builder: (context, rangeModel, child) {
        if (rangeModel.loadingLocationStatus) {
          return const Center(
            child: SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(ColorsApp.green),
              ),
            ),
          );
        }
        if (!rangeModel.visibilityStatus) {
          return Center(
              child: Column(
            children: [
              Text(
                StringsApp.filterErrorLocation,
                style: TextStylesApp.size14.copyWith(
                  color: ColorsApp.greyTestColor,
                ),
              ),
              CupertinoButton(
                onPressed: () => rangeModel.getUserPosition(callByButton: true),
                child: Text(
                  StringsApp.repeat,
                  style: TextStylesApp.size18.copyWith(
                    color: ColorsApp.green,
                  ),
                ),
              ),
            ],
          ));
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringsApp.filterDistance,
                  style: TextStylesApp.size16.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                Text(
                  '${StringsApp.filterFrom} ${rangeModel.rangeValues.start ~/ 1000} ${StringsApp.filterTo.toLowerCase()} ${rangeModel.rangeValues.end ~/ 1000} ${StringsApp.filterKm}',
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
              data: const SliderThemeData(
                trackHeight: 2,
                thumbColor: ColorsApp.white,
                activeTrackColor: ColorsApp.green,
                overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
              ),
              child: RangeSlider(
                inactiveColor: ColorsApp.inactiveBlack,
                values: rangeModel.rangeValues,
                min: rangeModel.min,
                max: rangeModel.max,
                onChanged: rangeModel.updateRangeValues,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _AcceptButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rangeFoundSights = Provider.of<_RangeModel>(context).foundSights();
    final categoryFoundSights =
        Provider.of<_CategoryModel>(context).foundSights();
    final foundSights = mocksSights.where(
      (sight) =>
          rangeFoundSights.any((element) => sight.name == element.name) &&
          categoryFoundSights.any((element) => sight.name == element.name),
    );
    return DefaultAcceptButton(
      text: '${StringsApp.filterShowBtn}${' (${foundSights.length})'}',
    );
  }
}

class _RangeModel extends ChangeNotifier {
  RangeValues? _rangeValues;
  double? _userPositionLat;
  double? _userPositionLon;
  bool _visibilityStatus = false;
  bool _loadingLocationStatus = true;

  static const _defaultRangeValues = RangeValues(100, 5000);
  static const double _min = 100.0;
  static const double _max = 10000.0;

  /// Если местоположение определено, показываем ui виджета расстояния
  bool get visibilityStatus => _visibilityStatus;

  /// Идет ли ожидание получения местоположения
  bool get loadingLocationStatus => _loadingLocationStatus;

  /// Радиус поиска
  RangeValues get rangeValues => _rangeValues ?? _defaultRangeValues;

  /// Минимальное значение радиуса
  double get min => _min;

  /// Максимальное значение радиуса
  double get max => _max;

  /// Обновить значение радиуса поиска
  void updateRangeValues(RangeValues newValue) {
    if (newValue.start >= _min && newValue.end <= max) {
      _rangeValues = newValue;
      notifyListeners();
    }
  }

  /// Сбросить значение филтра по радиусу
  void makeDefaultValue() {
    updateRangeValues(_defaultRangeValues);
    notifyListeners();
  }

  /// Определение местоположения пользователя
  /// callByButton - выполнить действия если метод был вызван нажатием кнопки
  Future<void> getUserPosition({bool callByButton = false}) async {
    try {
      _loadingLocationStatus = true;
      notifyListeners();
      final geoResult = await LocationService().determinePosition(
        openSettingsAfterError: callByButton,
      );
      _userPositionLat = geoResult.latitude;
      _userPositionLon = geoResult.longitude;
    } on LocationException catch (e) {
      e.printMessage();
    } finally {
      if (_userPositionLat != null && _userPositionLon != null) {
        _visibilityStatus = true;
      }
      _loadingLocationStatus = false;
      notifyListeners();
    }
  }

  bool _arePointsNear(
    double checkLat,
    double checkLon,
    double centerLat,
    double centerLon,
    double m,
  ) {
    const ky = 40000 / 360;
    final kx = math.cos(math.pi * centerLat / 180.0) * ky;
    final dx = (centerLon - checkLon).abs() * kx;
    final dy = (centerLat - checkLat).abs() * ky;
    return math.sqrt(dx * dx + dy * dy) <= m / 1000;
  }

  /// Поиск совпадающих мест
  List<Sight> foundSights() {
    if (!_visibilityStatus) {
      return mocksSights;
    }
    return mocksSights
        .where(
          (e) =>
              !_arePointsNear(
                e.lat,
                e.lon,
                _userPositionLat!,
                _userPositionLon!,
                rangeValues.start,
              ) &&
              _arePointsNear(
                e.lat,
                e.lon,
                _userPositionLat!,
                _userPositionLon!,
                rangeValues.end,
              ),
        )
        .toList();
  }
}

class _CategoryModel extends ChangeNotifier {
  final List<_Category> _categories =
      mocksTypeOfSight.map((e) => _Category(e)).toList();

  /// Категории фильтра
  List<_Category> get categories => _categories;

  /// Пометить выбранный элемент
  void onCheckItem(_Category category) {
    category.checkOpposite();
    notifyListeners();
  }

  /// Очистить выбранные категории
  void uncheckAllItems() {
    for (final category in _categories) {
      category.uncheck();
    }
    notifyListeners();
  }

  /// Поиск совпадающих мест
  List<Sight> foundSights() {
    return mocksSights
        .where(
          (sight) => _categories.any(
            (element) => element.isChecked && sight.type.text == element.text,
          ),
        )
        .toList();
  }
}

class _Category extends TypeOfSight {
  _Category(
    TypeOfSight typeOfSight,
  ) : super(
          icon: typeOfSight.icon,
          text: typeOfSight.text,
        );

  /// Выбрана ли категория
  bool get isChecked => _isChecked;
  bool _isChecked = false;

  void checkOpposite() {
    _isChecked = !isChecked;
  }

  void uncheck() {
    _isChecked = false;
  }
}
