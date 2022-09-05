// import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(
          child: Text(
            'App do Rafa',
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: const Icon(Icons.mic),
      ),
      backgroundColor: Colors.black12,
      body: Container(
        width: 300,
        height: 300,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(25)),
          color: Colors.amber,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Rafael'),
            const Text('Cardoso'),
            const Text('dos'),
            const Text('Reis'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: const Text(
                    'Aperte Aqui',
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.plagiarism, color: Colors.red, size: 30,), )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.black54,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.headphones,
              ),
              label: 'Headphones',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.battery_1_bar),
              label: 'Battery',
              backgroundColor: Colors.blueAccent),
        ],
      ),
    );
  }
}
