import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeDoisPage extends StatefulWidget {
  const HomeDoisPage({Key? key}) : super(key: key);

  @override
  State<HomeDoisPage> createState() => _HomeDoisPageState();
}

class _HomeDoisPageState extends State<HomeDoisPage> {
  int index = 0;
  double opacidade = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Stateful do Rafinha'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black38,
          unselectedLabelStyle: const TextStyle(color: Colors.black38),
          currentIndex: index,
          onTap: (int i) {
            setState(() {
              index = i;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Adicionar',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.remove),
                label: 'Remover ',
                backgroundColor: Colors.red)
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Agora você me vê',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black87.withOpacity(opacidade)),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    opacidade = (opacidade == 1.0 ? 0.0 : 1.0);
                  });
                },
                child: const Text('Mudar Opacidade'))
          ],
        ),
      ),
    );
  }
}
