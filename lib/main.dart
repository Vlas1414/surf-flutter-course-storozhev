import 'package:flutter/material.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screens/filters_screen.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      theme: isDarkMode ? darkTheme : lightTheme,
      home: FiltersScreen(),
      //SightDetailsScreen(),
      //SightDetailsScreen(),
      //VisitingScreen(),
    );
  }
}
