import 'package:flutter/material.dart';
import 'package:mais_um_projetin/my_home_page.dart';
import 'package:mais_um_projetin/cool_columns.dart';

void main() {
  runApp(MaterialApp(
    home: const MyHomePage(),
    routes: {
      '/gappedColumn': (context) => const CoolColumns(),
    },
    theme: ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.purple,
          onPrimary: Colors.white70,
          secondary: Colors.teal,
          onSecondary: Colors.black87,
          error: Colors.redAccent,
          onError: Colors.black87,
          background: Colors.white70,
          onBackground: Colors.black87,
          surface: Colors.white70,
          onSurface: Colors.black87),
      fontFamily: 'Verdana',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
        headline4: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
    ),
  ));
}
