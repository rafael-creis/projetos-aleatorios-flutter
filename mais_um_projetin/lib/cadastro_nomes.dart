import 'package:flutter/material.dart';

class CadastroNomes extends StatefulWidget {
  const CadastroNomes({Key? key}) : super(key: key);

  @override
  State<CadastroNomes> createState() => _CadastroNomesState();
}

class _CadastroNomesState extends State<CadastroNomes> {
  final controller = TextEditingController();
  final list = <String>[];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Nomes em um Array'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        gapPadding: 1,
                      ),
                      label: Text('Nomes')),
                )),
                IconButton(
                    onPressed: () {
                      final text = controller.text;
                      setState(() {
                        list.add(text);
                      });
                      controller.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).colorScheme.secondary,
                    ))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: screenSize.height / 12,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                        child: Text(
                      item,
                      style: const TextStyle(fontSize: 20),
                    )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
