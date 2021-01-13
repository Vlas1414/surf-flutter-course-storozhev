import 'package:flutter/material.dart';
import 'package:places/ui/screens/res/themes.dart';
import 'package:places/ui/screens/sight_details_screen.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/screens/visiting_screen.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var isDarkMode = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      theme: isDarkMode ? darkTheme : lightTheme,
      home: // SightListScreen(),
          //SightDetailsScreen(),
          VisitingScreen(),
    );
  }
}
