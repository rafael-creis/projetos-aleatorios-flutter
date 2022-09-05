import 'package:flutter/material.dart';
import 'package:projetin_daorinha_so_o_treino/main.dart';

class MediaQueryPage extends StatefulWidget {
  const MediaQueryPage({Key? key}) : super(key: key);

  @override
  State<MediaQueryPage> createState() => _MediaQueryPageState();
}

class _MediaQueryPageState extends State<MediaQueryPage> {
  String? mdQuery = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medias Querys Dahorinhas'),
        backgroundColor: MainColors.mainColor,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: (MediaQuery.of(context).size.height -
            kToolbarHeight -
            MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$mdQuery',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: (MediaQuery.of(context).size.height -
                      kToolbarHeight -
                      MediaQuery.of(context).padding.top) /
                  1.75,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: MainColors.mainColor, width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        mdQuery =
                            "A largura da página é: ${MediaQuery.of(context).size.width.round()}";
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MainColors.mainColor)),
                    child: const Text('Largura da página'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        mdQuery =
                            "A altura da página é: ${MediaQuery.of(context).size.height.round().toString()}";
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MainColors.mainColor)),
                    child: const Text('Altura da página'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          mdQuery =
                              "A altura da página sem a AppBar é: ${(MediaQuery.of(context).size.height - kToolbarHeight).round()}";
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MainColors.mainColor)),
                      child: const Text(
                        'Altura da página sem a AppBar',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          mdQuery =
                              "A altura da página sem a AppBar e sem a StatusBar: ${(MediaQuery.of(context).size.height - kToolbarHeight - MediaQuery.of(context).padding.top).round()}";
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MainColors.mainColor)),
                      child: const Text(
                        'Altura da página sem a AppBar e sem StatusBar',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
