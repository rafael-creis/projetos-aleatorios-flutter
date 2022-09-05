import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Future
Future<int> multDois(int a) {
  return Future.delayed(const Duration(seconds: 3), () {
    return a * 2;
  });
}

// Stream
Stream<String> contador(a) {
  return Stream.periodic(const Duration(seconds: 1), (value) {
    return (a += 1) % 2 == 0
        ? 'Este é um número Par'
        : 'Este é um número Ímpar';
  });
}

// Generator
Iterable<int> umDoisTres() sync* {
  yield 1;
  yield 2;
  yield 3;
}

// Para não precisar fazer essas duas classes que fazem a mesma coisa, mas com tipos de veriáveis diferentes, nós usamos Generics
class ParDeStrings {
  final String valor1;
  final String valor2;

  ParDeStrings(this.valor1, this.valor2);
}

class ParDeIntegers {
  final int valor1;
  final int valor2;

  ParDeIntegers(this.valor1, this.valor2);
}

class Par<A, B> {
  final A valor1;
  final B valor2;

  Par(this.valor1, this.valor2);
}

void teste() async {
  // Future
  // final produto = await multDois(10);
  // print(produto);

  // Stream
  // await for (final resultado in contador(1)) {
  // print(resultado);
  // }
  // print('Término do Stream');

  // Generators
  // for (final numero in umDoisTres()) {
  //   print(numero);
  //   if (numero == 2) {
  //     break;
  //   }
  // }
  // print(umDoisTres());

  // Generics
  // final pessoa = Par("Rafael", 18);
  // print(pessoa.valor1);
  // print(pessoa.valor2);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // teste();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
