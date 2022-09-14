import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri linkTwitter =
      Uri(scheme: 'https', host: 'www.twitter.com', path: 'apicataas');
  final Uri linkBuyMeACoffe =
      Uri(scheme: 'https', host: 'www.buymeacoffee.com', path: 'kevinbalicot');

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
                _navegarEmBrowser(linkTwitter);
              },
              icon: const Icon(FontAwesome.twitter)),
          IconButton(
              onPressed: () {
                _navegarEmBrowser(linkBuyMeACoffe);
              },
              icon: const Icon(FontAwesome.beer)),
        ],
      ),
      body: Container(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CATAAS',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              letterSpacing: 1.5),
                        ),
                        const Text(
                          'Cat as a service',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        RichText(
                          text: const TextSpan(
                              style: TextStyle(fontSize: 15),
                              children: [
                                TextSpan(
                                    text:
                                        'Is a REST API to spread peace and love (or not) thanks to cats.')
                              ]),
                        )
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

Future<void> _navegarEmBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}
