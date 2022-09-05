
import 'package:flutter/material.dart';
// import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
        title: Center(
            child: Container(
          width: 140,
          decoration: const BoxDecoration(
              color: Colors.black87,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 3,
                  spreadRadius: 2.5,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: const Center(
            child: Text(
              'App do Bato',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
          ),
        )),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GestureDetector(
            onTap: () => player.play(AssetSource('miado_bago.mp4')),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset('assets/MicrosoftTeams-image.png'),
            ),
          ),
        ),
      ),
    );
  }
}
