import 'package:flutter/material.dart';
import 'package:projetin_daorinha_so_o_treino/main.dart';

class NovaPaniga extends StatelessWidget {
  const NovaPaniga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Nova Pagina do App do Rafinha'),
        backgroundColor: MainColors.mainColor,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, ModalRoute.of(context)!.settings.arguments);
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MainColors.secColor)),
              child: const Text('Voltar'),
            ),
            Text('Seu id é: ${ModalRoute.of(context)!.settings.arguments}'),
          ],
        ),
      ),
    );
  }
}
