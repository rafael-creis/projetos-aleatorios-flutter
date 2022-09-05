import 'package:flutter/material.dart';
import 'package:projetin_daorinha_so_o_treino/home_navegacao.dart';
import 'package:projetin_daorinha_so_o_treino/home_page.dart';
import 'package:projetin_daorinha_so_o_treino/panigas/faq_page.dart';
import 'package:projetin_daorinha_so_o_treino/panigas/nova_paniga.dart';
import 'package:projetin_daorinha_so_o_treino/panigas/sobre_nos_page.dart';
// import 'package:projetin_daorinha_so_o_treino/stateful.dart';

void main() {
  runApp( MaterialApp(
    home: const HomeNavegacao (),
    routes: {
      '/sobre_nos': (context) => const SobreNosPage(),
      '/faq':(context) => const FaqPage(),
      '/nova_paniga':(context) => const NovaPaniga(),
    },
  ));
}

class MainColors {
  static var mainColor = Colors.amber; 
  static var secColor = Colors.red; 
  static var terColor = Colors.green; 
}
