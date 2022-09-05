import 'package:flutter/material.dart';

class ScrollableView extends StatelessWidget {
  const ScrollableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listaNomes = [
      'Rafael',
      'Sérgio',
      'Lincoln',
      'Maurício',
      'Matheus',
      'Alysson',
      'Gabriel',
      'Giovanna',
      'Lucas',
      'Gustavo'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora com um Scrouu'),
      ),
      body: SizedBox(
          child: ListView.builder(
        itemCount: listaNomes.length * 10,
        itemBuilder: (context, index) {
          return Container(
            // width: MediaQuery.of(context).size.width,
            height: 80,
            color: index % 3 == 0
                ? Colors.teal
                : index % 3 == 1
                    ? Colors.amber
                    : Colors.deepOrange,
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    index % 7 == 0
                        ? Icons.star
                        : index % 7 == 2
                            ? Icons.nat
                            : index % 7 == 4
                                ? Icons.pix
                                : index % 7 == 6
                                    ? Icons.terminal
                                    : Icons.ondemand_video,
                    size: 35,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(right: 43),
                      child: Text(
                        listaNomes[index >= listaNomes.length
                            ? index % listaNomes.length
                            : index],
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
