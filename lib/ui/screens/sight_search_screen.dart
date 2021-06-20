import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/assets_app.dart';
import 'package:places/constants/colors_app.dart';
import 'package:places/constants/strings_app.dart';
import 'package:places/constants/text_styles_app.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/sight_details_screen.dart';
import 'package:places/ui/utils/action_row.dart';
import 'package:places/ui/utils/default_app_bar.dart';
import 'package:places/ui/utils/image_loading.dart';
import 'package:places/ui/utils/search_bar.dart';
import 'package:provider/provider.dart';

/// Экран поиска мест
class SightSearchScreen extends StatelessWidget {
  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchingModel(),
      builder: (context, child) {
        return const Scaffold(
          appBar: DefaultAppBar(
            title: StringsApp.appMainTitle,
            bottom: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: _SearchBar(),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: _Content(),
          ),
        );
      },
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchingModel>(
      builder: (context, searchingModel, child) {
        return SearchBar(
          isActive: true,
          value: searchingModel.searchingText,
          onWrite: (newValue) {
            searchingModel.search(newValue: newValue);
          },
        );
      },
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchingModel>(
      builder: (context, searchingModel, child) {
        if (searchingModel.isLoading) {
          return const _Loading();
        }
        if (searchingModel.isNothingFinded) {
          return const _NothingFinded();
        }
        if (searchingModel.findedPlaces.isNotEmpty) {
          return _ResultSearching(searchingModel.findedPlaces);
        }

        return _HistorySearching(
          searchingModel.searchingHistory,
          () => searchingModel.clearHistory(),
          (text) => searchingModel.removeItemFromHistory(text),
          (text) => searchingModel.search(newValue: text),
        );
      },
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ResultSearching extends StatelessWidget {
  const _ResultSearching(this.findedPlaces, {Key? key}) : super(key: key);

  final List<Sight> findedPlaces;

  @override
  Widget build(BuildContext context) {
    Widget itemRow(
      String title,
      String type,
      String imageUrl,
      Function() onPressed, {
      bool isLastRow = false,
    }) {
      final content = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorsApp.inactiveBlack,
            ),
            child: ImageLoading(imageUrl),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  title,
                  style: TextStylesApp.size16.copyWith(
                    color: ColorsApp.main,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  type,
                  style: TextStylesApp.size14.copyWith(
                    color: ColorsApp.secondary2,
                  ),
                ),
                if (!isLastRow) ...[
                  const SizedBox(height: 12),
                  const Divider(
                    color: ColorsApp.inactiveBlack,
                    height: 9,
                  ),
                ],
              ],
            ),
          ),
        ],
      );
      return Padding(
        padding: const EdgeInsets.all(10),
        child: CupertinoButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          minSize: 0,
          child: content,
        ),
      );
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        final place = findedPlaces[index];
        return itemRow(
          place.name,
          place.type.text,
          place.url,
          () {
            Navigator.push(
              context,
              MaterialPageRoute<bool>(
                builder: (context) => SightDetailsScreen(sightId: place.id),
              ),
            );
          },
          isLastRow: findedPlaces.length - 1 == index,
        );
      },
      itemCount: findedPlaces.length,
    );
  }
}

class _HistorySearching extends StatelessWidget {
  const _HistorySearching(
    this.searchingHistory,
    this.onClearHistory,
    this.onRemoveItemFromHistory,
    this.onSelectItem, {
    Key? key,
  }) : super(key: key);

  final List<String> searchingHistory;
  final Function() onClearHistory;
  final Function(String) onRemoveItemFromHistory;
  final Function(String) onSelectItem;

  @override
  Widget build(BuildContext context) {
    if (searchingHistory.isEmpty) {
      return const SizedBox();
    }

    final reversedListOfSearchingHistory = searchingHistory.reversed.toList();

    Widget itemRow(String text, {bool isLastRow = false}) {
      return ActionRow(
        text: text,
        onTap: () => onSelectItem(text),
        color: ColorsApp.secondary2,
        action: CupertinoButton(
          onPressed: () => onRemoveItemFromHistory(text),
          padding: EdgeInsets.zero,
          minSize: 0,
          child: Image.asset(
            AssetsApp.crossIcon,
            width: 24,
            height: 24,
            color: ColorsApp.inactiveBlack,
          ),
        ),
        isShowBottomLine: !isLastRow,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          StringsApp.searchSightYouSearched.toUpperCase(),
          style: TextStylesApp.size12.copyWith(
            color: ColorsApp.inactiveBlack,
          ),
        ),
        const SizedBox(height: 5),
        ...List<Widget>.generate(
          reversedListOfSearchingHistory.length > 4
              ? 4
              : reversedListOfSearchingHistory.length,
          (index) {
            return itemRow(
              reversedListOfSearchingHistory[index],
              isLastRow: 3 == index ||
                  reversedListOfSearchingHistory.length - 1 == index,
            );
          },
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.centerLeft,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onClearHistory,
            child: Text(
              StringsApp.searchSightClearHistory,
              style: TextStylesApp.size16Weight500.copyWith(
                color: ColorsApp.green,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _NothingFinded extends StatelessWidget {
  const _NothingFinded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            width: 64,
            height: 64,
            image: AssetImage(
              AssetsApp.searchIcon,
            ),
            color: ColorsApp.inactiveBlack,
          ),
          const SizedBox(height: 24),
          Text(
            StringsApp.searchSightNothingFinded,
            style: TextStylesApp.size18Weight500.copyWith(
              color: ColorsApp.inactiveBlack,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 253,
            child: Text(
              StringsApp.searchSightTryToChangeParamsOfSearching,
              style: TextStylesApp.size14.copyWith(
                color: ColorsApp.inactiveBlack,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class SearchingModel extends ChangeNotifier {
  final List<String> _searchingHistory = [];

  String _searchingText = '';
  List<Sight> _findedPlaces = [];
  bool _isLoading = false;
  Timer? _searchDebaunce;

  /// Текст поиска
  String get searchingText => _searchingText;

  /// Найденные места
  List<Sight> get findedPlaces => _findedPlaces;

  /// История поиска
  List<String> get searchingHistory => _searchingHistory;

  /// Идет ли загрузка
  bool get isLoading => _isLoading;

  /// Если ничего не найдено
  bool get isNothingFinded =>
      _findedPlaces.isEmpty && _searchingText.length > 1;

  /// Очистка истории
  void clearHistory() {
    _searchingHistory.clear();
    notifyListeners();
  }

  /// Очистка истории
  void removeItemFromHistory(String text) {
    _removeItemFromHistory(text);
    notifyListeners();
  }

  void _removeItemFromHistory(String text) {
    final tempArray = [..._searchingHistory];
    _searchingHistory
      ..clear()
      ..addAll(
        tempArray.where(
          (element) => element != text,
        ),
      );
  }

  void _addToHistory(String text) {
    _removeItemFromHistory(text);
    _searchingHistory.add(text);
  }

  /// Поиск места
  void search({required String newValue}) {
    if (_searchingText == newValue) {
      return;
    }
    _searchDebaunceFunc(() {
      _searchingText = newValue;

      if (_searchingText.length > 1) {
        _addToHistory(_searchingText);
        _searchPlace();
      } else {
        _findedPlaces = [];
        _isLoading = false;
      }
      notifyListeners();
    });
  }

  void _searchDebaunceFunc(Function func) {
    if (_searchDebaunce?.isActive ?? false) _searchDebaunce!.cancel();
    _searchDebaunce = Timer(const Duration(milliseconds: 500), () {
      func();
    });
  }

  void _searchPlace() {
    _isLoading = true;
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        if (_isLoading) {
          _findedPlaces = mocksSights
              .where(
                (element) =>
                    element.name.contains(_searchingText) ||
                    element.type.text.contains(_searchingText),
              )
              .toList();
          _isLoading = false;
          notifyListeners();
        }
      },
    );
  }
}
