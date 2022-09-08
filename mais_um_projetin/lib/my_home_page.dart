import 'package:flutter/material.dart';
import 'package:mais_um_projetin/cadastro_nomes.dart';
import 'package:mais_um_projetin/cool_columns.dart';
import 'package:mais_um_projetin/scrollable_view.dart';
import 'package:mais_um_projetin/usando_stack.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu App daorinha'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Vc clicou nesse botaum $counter vezes'),
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CoolColumns(),
                    )),
                child: const Text('Página com o Gap')),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScrollableView(),
                    )),
                child: const Text('Página com Scrouu')),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CadastroNomes(),
                    )),
                child: const Text('Cadastro de Nomes')),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UsandoStack(),
                    )),
                child: const Text('Vendo o Uso de Stack')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
