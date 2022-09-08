import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

class Contato {
  final String nome;

  const Contato({required this.nome});
}


class ListaDeContatos {
  ListaDeContatos._instanciaCompartilhada();
  static final ListaDeContatos _compartilhada = ListaDeContatos._instanciaCompartilhada();
  factory ListaDeContatos() => _compartilhada;

  final List<Contato> _contatos = [];
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Helo World')),
    );
  }
}
