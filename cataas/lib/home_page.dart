import 'package:cataas/auxiliar/drawer_tiles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';

Future<void> _openInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}

Future<List<dynamic>> _getTags() async {
  final url = Uri.parse("https://cataas.com/api/tags");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return convert.jsonDecode(response.body) as List<dynamic>;
  } else {
    throw ("_getTags request failed. Status code: ${response.statusCode}");
  }
}

Future<Map<String, dynamic>> _getRandomCat(String query) async {
  late Map<String, dynamic> jsonResponse;
  late int statusCode;
  await _getRandomCatJSON(query).then((value) => {
        jsonResponse = _convertJSON(value),
        statusCode = _getRandomCatStatusCode(value)
      });
  return {"statusCode": statusCode, "body": jsonResponse};
}

Future<http.Response> _getRandomCatJSON(String query) async {
  final url = Uri.parse("https://cataas.com/cat$query?json=true");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return response;
  } else {
    throw ("_getRandomCat request failed. Status code: ${response.statusCode}");
  }
}

Map<String, dynamic> _convertJSON(http.Response response) {
  return convert.jsonDecode(response.body);
}

int _getRandomCatStatusCode(http.Response response) {
  return response.statusCode;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String exampleQuery = "/says/Hello World";
  late Future<Map<String, dynamic>> catMap;
  late Future<List<dynamic>> catTags;
  String catUrl = "https://cataas.com";

  @override
  void initState() {
    catMap = _getRandomCat(exampleQuery);
    catTags = _getTags();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat as a Service',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                _openInBrowser(Uri.parse('https://twitter.com/apicataas'));
              },
              icon: const Icon(FontAwesome.twitter)),
          IconButton(
              onPressed: () {
                _openInBrowser(Uri(
                    scheme: 'https',
                    host: 'www.buymeacoffee.com',
                    path: 'kevinbalicot'));
              },
              icon: const Icon(FontAwesome.beer)),
        ],
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
                  _openInBrowser(Uri.parse("https://cataas.com/#/upload"));
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
                  _openInBrowser(Uri.parse(
                      'https://firewall.oauthorize.tk/privacy-policy?client_id=cataas'));
                },
                child: const DrawerTiles(
                  title: "Privacy Policy",
                  icon: Icons.privacy_tip,
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(bottom: 50),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 48,
                margin: const EdgeInsets.symmetric(vertical: 50),
                child: Material(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    onTap: () {
                      setState(() {
                        catMap = _getRandomCat(exampleQuery);
                      });
                    },
                    child: const Center(
                      child: Text(
                        "Give me a Cat 🐱",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 180),
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(boxShadow: [
                    const BoxShadow(color: Colors.black, spreadRadius: 5.5),
                    const BoxShadow(color: Colors.white, spreadRadius: 5),
                    const BoxShadow(color: Colors.black, spreadRadius: .5),
                    BoxShadow(color: Colors.grey[100]!),
                  ]),
                  child: FutureBuilder(
                    future: catMap,
                    builder: (context, snapshot) {
                      Widget options;
                      if (snapshot.hasData) {
                        if (snapshot.data!['statusCode'] == 200) {
                          options =
                              Stack(alignment: Alignment.center, children: [
                            CircularProgressIndicator(
                                color: Theme.of(context).primaryColor),
                            Image.network(
                                catUrl + snapshot.data!['body']['url']),
                          ]);
                        } else {
                          options = const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Sorry, it seems we do not have this image 😿. Please, try another one.',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      } else if (snapshot.hasError) {
                        options = const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Sorry, it seems we made a mistake 😿. Please, try again later.',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        options = Center(
                          child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor),
                        );
                      }
                      return options;
                    },
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 80),
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: BoxDecoration(boxShadow: [
                    const BoxShadow(color: Colors.black, spreadRadius: 5.5),
                    const BoxShadow(color: Colors.white, spreadRadius: 5),
                    const BoxShadow(color: Colors.black, spreadRadius: .5),
                    BoxShadow(color: Colors.grey[100]!),
                  ]),
                  child: FutureBuilder(
                    future: catMap,
                    builder: (context, snapshot) {
                      Widget options;
                      if (snapshot.hasData) {
                        options = Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('ID: ${snapshot.data!["body"]["id"]}'),
                                  TextButton(
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(
                                            text:
                                                '${snapshot.data!["body"]["id"]}}'));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              'Image ID copied with sucess 😸'),
                                          backgroundColor: Colors.amber,
                                        ));
                                      },
                                      child: const Text('Copiar ID'))
                                ],
                              ),
                              //TODO Bota o texto real aqui dentro
                              const Text('Image Text: Hello World'),
                              Text(
                                  'Date of posting: ${_getFormattedDate(snapshot.data!["body"]["created_at"])}'),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(fontSize: 15),
                                      children: [
                                    const TextSpan(
                                        text: 'Text image link: ',
                                        style: TextStyle(color: Colors.black)),
                                    TextSpan(
                                        text:
                                            '$catUrl${snapshot.data!["body"]["url"]}',
                                        style:
                                            TextStyle(color: Colors.blue[800]),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            _openInBrowser(Uri.parse(
                                                '$catUrl${snapshot.data!["body"]["url"]}'));
                                          }),
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(fontSize: 15),
                                      children: [
                                    const TextSpan(
                                        text: 'Original image link: ',
                                        style: TextStyle(color: Colors.black)),
                                    TextSpan(
                                        text: _getOriginalImageURL(
                                            '$catUrl${snapshot.data!["body"]["url"]}'),
                                        style:
                                            TextStyle(color: Colors.blue[800]),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            _openInBrowser(Uri.parse(
                                                _getOriginalImageURL(
                                                    '$catUrl${snapshot.data!["body"]["url"]}')));
                                          }),
                                  ]))
                            ],
                          ),
                        );
                      } else {
                        options = const SizedBox();
                      }
                      return options;
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String _getFormattedDate(String date) {
  return date.substring(0, date.indexOf("T")).split('-').reversed.join('-');
}

_getOriginalImageURL(String url) {
  return url.substring(0, 47);
}
