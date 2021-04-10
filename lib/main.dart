import 'package:flutter/material.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screens/filters_screen.dart';
import 'package:places/ui/screens/settings_screen.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      builder: (context, child) {
        return Consumer<ThemeModel>(
          builder: (context, themeModel, child) {
            return MaterialApp(
              title: 'Places',
              theme: themeModel.isDarkMode ? darkTheme : lightTheme,
              home: //SettingsScreen(),
                  //FiltersScreen(),
                  SightListScreen(),
              //SightDetailsScreen(),
              //VisitingScreen(),
            );
          },
        );
      },
    );
  }
}

class ThemeModel extends ChangeNotifier {
  bool _isDarkMode = false;

  /// Выбрана ли темная тема
  bool get isDarkMode => _isDarkMode;

  void changeMode({bool newValue}) {
    if (newValue != null) {
      _isDarkMode = newValue;
      notifyListeners();
    }
  }
}
