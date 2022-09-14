import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: const Color.fromRGBO(233, 84, 32, 1)),
    home: HomePage(),
  ));
}
