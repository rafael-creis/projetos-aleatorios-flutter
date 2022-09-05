import 'package:flutter/material.dart';
import 'package:projetin_daorinha_so_o_treino/main.dart';

class ListasPage extends StatelessWidget {
  const ListasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainColors.mainColor,
        title: const Text('A Lista tá na Pista 😎'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            // width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            // color: Colors.blue,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 200,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width / 2,
                  margin: const EdgeInsets.all(10),
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: MainColors.secColor, width: 3)),
                      child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset(
                            'assets/images/3X/cass_poster.png',
                            fit: BoxFit.contain,
                          ))),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   // crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: const[
        //     Text('Texto 1'),
        //     Text('Texto 2'),
        //     Text('Texto 3'),
        //   ],
        // ),