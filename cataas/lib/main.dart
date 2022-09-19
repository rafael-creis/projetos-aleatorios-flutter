import 'package:cataas/about.dart';
import 'package:cataas/authors.dart';
import 'package:cataas/form_field.dart';
import 'package:cataas/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: const Color.fromRGBO(233, 84, 32, 1)),
    home: const HomePage(),
    routes: {
      '/about': (context) => const About(),
      '/authors': ((context) => const Authors())
    },
  ));
}
