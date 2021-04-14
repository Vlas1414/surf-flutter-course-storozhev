import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/assets_app.dart';
import 'package:places/constants/colors_app.dart';
import 'package:places/constants/strings_app.dart';
import 'package:places/constants/text_styles_app.dart';
import 'package:places/main.dart';
import 'package:places/ui/utils/default_app_bar.dart';
import 'package:places/ui/utils/default_bottom_navigaion_bar.dart';
import 'package:provider/provider.dart';

/// Экран настроек приложения
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget buildRow({required String text, Widget? action, Function? onTap}) {
      return InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap as void Function()?,
        child: SizedBox(
          height: 48,
          child: Row(
            children: [
              Text(
                text,
                style: TextStylesApp.size16.copyWith(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              const Spacer(),
              action!,
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: const DefaultAppBar(
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
                    onChanged: (value) {
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
            const Divider(color: ColorsApp.inactiveBlack),
          ],
        ),
      ),
      bottomNavigationBar: const DefaultBottomNavigationBar(),
    );
  }
}
