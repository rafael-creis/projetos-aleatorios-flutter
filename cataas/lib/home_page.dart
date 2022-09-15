import 'package:cataas/auxiliar/drawer_tiles.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';

Future<void> _abrirEmBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}

Future<List<dynamic>> _getTags() async {
  final url = Uri.parse("https://cataas.com/api/tags");
  // ignore: unused_local_variable
  var jsonResponse = [];
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
  } else {
    throw ("Request failed. Status code: ${response.statusCode}");
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _getTags();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat As A Service',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                _abrirEmBrowser(Uri.parse('https://twitter.com/apicataas'));
              },
              icon: const Icon(FontAwesome.twitter)),
          IconButton(
              onPressed: () {
                _abrirEmBrowser(Uri(
                    scheme: 'https',
                    host: 'www.buymeacoffee.com',
                    path: 'kevinbalicot'));
              },
              icon: const Icon(FontAwesome.beer)),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width / 2,
              height: 48,
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(40), right: Radius.circular(40))),
                      child: Center(child: Text("Ola"),),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'CATAAS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          letterSpacing: 1.5),
                    ),
                    Text(
                      'Cat as a service',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'A REST API to spread peace and love (or not) thanks to cats.',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      'More than 1000 cats for now',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                )),
            GestureDetector(
                onTap: () {
                  _abrirEmBrowser(Uri.parse("https://cataas.com/#/upload"));
                },
                child: const DrawerTiles(
                  title: "Post a Cat",
                  icon: FontAwesome.paw,
                )),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/about");
                },
                child: const DrawerTiles(
                  title: "About",
                  icon: FontAwesome.info,
                )),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/about");
                },
                child: const DrawerTiles(
                  title: "Authors",
                  icon: Icons.person,
                )),
            GestureDetector(
                onTap: () {
                  _abrirEmBrowser(Uri.parse(
                      'https://firewall.oauthorize.tk/privacy-policy?client_id=cataas'));
                },
                child: const DrawerTiles(
                  title: "Privacy Policy",
                  icon: Icons.privacy_tip,
                )),
          ],
        ),
      ),
    );
  }
}
