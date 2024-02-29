import 'package:flutter/material.dart';

import 'screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Booking Management Dashboard',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primaryColor: Colors.indigo),
      theme: ThemeData(
        brightness: Brightness.light,

        primaryColor: Colors.red.shade900,
        // primaryColorLight: Colors.white,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red.shade900,
        // primaryColorDark: Colors.grey,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.light,
      /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
      home: HomeScreen(),
    );
  }
}
