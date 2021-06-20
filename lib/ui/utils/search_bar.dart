import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/assets_app.dart';
import 'package:places/constants/colors_app.dart';
import 'package:places/constants/strings_app.dart';
import 'package:places/ui/screens/filters_screen.dart';
import 'package:places/ui/screens/sight_search_screen.dart';
import 'package:places/ui/utils/default_text_input.dart';

/// Поисковое меню
class SearchBar extends StatefulWidget {
  const SearchBar({
    this.isActive = false,
    this.onWrite,
    this.value = '',
    Key? key,
  }) : super(key: key);

  final bool isActive;
  final Function(String)? onWrite;
  final String value;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    if (widget.onWrite != null) {
      controller.addListener(() {
        widget.onWrite!(controller.text);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.text.isEmpty) {
      controller.value = TextEditingValue(
        text: widget.value,
        selection: TextSelection.fromPosition(
          TextPosition(
            offset: widget.value.length,
          ),
        ),
      );
    }
    final input = DefaultTextInput(
      readOnly: !widget.isActive,
      hintText: StringsApp.search,
      fillColor: ColorsApp.background,
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      prefixIcon: const Padding(
        padding: EdgeInsets.only(left: 12.0, right: 12),
        child: Image(
          width: 25,
          height: 25,
          image: AssetImage(
            AssetsApp.searchIcon,
          ),
          color: ColorsApp.inactiveBlack,
        ),
      ),
      autofocus: true,
      onTap: widget.isActive
          ? null
          : () {
              Navigator.push(
                context,
                NoAnimationMaterialPageRoute<bool>(
                  builder: (context) => const SightSearchScreen(),
                ),
              );
            },
      controller: controller,
    );
    if (widget.isActive) {
      return input;
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: const BoxDecoration(
        color: ColorsApp.background,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: input,
          ),
          CupertinoButton(
            padding: const EdgeInsets.only(left: 12.0, right: 12),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute<bool>(
                  builder: (context) => const FiltersScreen(),
                ),
              );
            },
            child: const Image(
              width: 25,
              height: 25,
              color: ColorsApp.green,
              image: AssetImage(
                AssetsApp.filterIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
            builder: builder,
            maintainState: maintainState,
            settings: settings,
            fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
