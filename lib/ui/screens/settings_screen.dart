import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/assets_app.dart';
import 'package:places/constants/colors_app.dart';
import 'package:places/constants/strings_app.dart';
import 'package:places/main.dart';
import 'package:places/ui/utils/action_row.dart';
import 'package:places/ui/utils/default_app_bar.dart';
import 'package:places/ui/utils/default_bottom_navigaion_bar.dart';
import 'package:provider/provider.dart';

/// Экран настроек приложения
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: StringsApp.settingsTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ActionRow(
              text: StringsApp.settingsDarkThemeName,
              action: Consumer<ThemeModel>(
                builder: (context, themeModel, child) {
                  return CupertinoSwitch(
                    value: themeModel.isDarkMode,
                    onChanged: (value) {
                      Provider.of<ThemeModel>(context, listen: false)
                          .changeMode(newValue: value);
                    },
                  );
                },
              ),
            ),
            ActionRow(
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
          ],
        ),
      ),
      bottomNavigationBar: const DefaultBottomNavigationBar(),
    );
  }
}
