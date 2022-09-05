import 'package:flutter/material.dart';
import 'package:projetin_daorinha_so_o_treino/main.dart';

class SobreNosPage extends StatelessWidget {
  const SobreNosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sobre Nós do App do Rafinha'),
        backgroundColor: MainColors.mainColor,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MainColors.mainColor)),
              child: const Text('Fechar Página'),
            ),
          ],
        ),
      ),
    );
  }
}
