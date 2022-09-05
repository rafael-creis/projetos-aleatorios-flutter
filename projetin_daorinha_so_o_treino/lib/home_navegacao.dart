import 'package:flutter/material.dart';
import 'package:projetin_daorinha_so_o_treino/panigas/faq_page.dart';
import 'package:projetin_daorinha_so_o_treino/panigas/listas_page.dart';
import 'package:projetin_daorinha_so_o_treino/panigas/media_query_page.dart';
import 'package:projetin_daorinha_so_o_treino/panigas/nova_paniga.dart';
import 'package:projetin_daorinha_so_o_treino/panigas/sobre_nos_page.dart';
import 'package:projetin_daorinha_so_o_treino/main.dart';

class HomeNavegacao extends StatelessWidget {
  const HomeNavegacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Navegando o App do Rafinha'),
        backgroundColor: MainColors.mainColor,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 250,
                decoration: BoxDecoration(
                    border: Border.all(color: MainColors.secColor, width: 3)),
                child: Image.asset(
                  'assets/images/cass_poster.png',
                )),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/faq');
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MainColors.mainColor)),
              child: const Text('Botaum do FAQ'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/sobre_nos');
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MainColors.mainColor)),
              child: const Text('Botaum do Sobre Nós'),
            ),
            ElevatedButton(
              onPressed: () async {
                final idPessoa = await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const NovaPaniga(),
                        settings: const RouteSettings(arguments: 1234)));
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MainColors.mainColor)),
              child: const Text('Botaum da Nova Paniga'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MediaQueryPage(),
                  ));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MainColors.mainColor)),
                child: const Text('Botaum das Medias Queries')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ListasPage(),
                  ));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MainColors.mainColor)),
                child: const Text('Botaum das Listas Malucas'))
          ],
        ),
      ),
    );
  }
}
