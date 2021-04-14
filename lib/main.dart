import 'package:flutter/material.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screens/add_sight_screen.dart';
import 'package:places/ui/screens/filters_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
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
              home: const AddSightScreen(),
              //SettingsScreen(),
              // const FiltersScreen(),
              //const SightListScreen(),
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

  void changeMode({bool? newValue}) {
    if (newValue != null) {
      _isDarkMode = newValue;
      notifyListeners();
    }
  }
}
