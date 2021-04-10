import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/assetsApp.dart';
import 'package:places/constants/colorsApp.dart';
import 'package:places/constants/stringsApp.dart';
import 'package:places/constants/textStylesApp.dart';
import 'package:places/main.dart';
import 'package:places/ui/utils/default_app_bar.dart';
import 'package:places/ui/utils/default_bottom_navigaion_bar.dart';
import 'package:provider/provider.dart';

/// Экран настроек приложения
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildRow({String text, Widget action, Function onTap}) {
      return InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: onTap,
        child: Container(
          height: 48,
          child: Row(
            children: [
              Text(
                text,
                style: TextStylesApp.size16.copyWith(
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
              ),
              const Spacer(),
              action,
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: DefaultAppBar(
        title: StringsApp.settingsTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildRow(
              text: StringsApp.settingsDarkThemeName,
              action: Consumer<ThemeModel>(
                builder: (context, themeModel, child) {
                  return CupertinoSwitch(
                    value: themeModel.isDarkMode,
                    onChanged: (bool value) {
                      Provider.of<ThemeModel>(context, listen: false)
                          .changeMode(newValue: value);
                    },
                  );
                },
              ),
            ),
            const Divider(
              color: ColorsApp.inactiveBlack,
            ),
            buildRow(
              text: StringsApp.settingsWhatchTutorial,
              action: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  AssetsApp.infoIcon,
                  width: 24,
                  color: ColorsApp.green,
                ),
              ),
              onTap: () {},
            ),
            Divider(
              color: ColorsApp.inactiveBlack,
            ),
          ],
        ),
      ),
      bottomNavigationBar: DefaultBottomNavigationBar(),
    );
  }
}
