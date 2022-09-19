import 'package:cataas/form_field.dart';
import 'package:cataas/layers/domain/usecases/get_cat_amount.dart';
import 'package:cataas/layers/domain/usecases/get_formatted_date.dart';
import 'package:cataas/layers/domain/usecases/get_original_image_url.dart';
import 'package:cataas/layers/domain/usecases/get_random_cat.dart';
import 'package:cataas/layers/domain/usecases/get_tags.dart';
import 'package:cataas/layers/domain/usecases/open_browser.dart';
import 'auxiliar/color_palette.dart';
import 'package:cataas/auxiliar/drawer_tiles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetTags getTags = GetTags();
  final GetRandomCat getRandomCat = GetRandomCat();
  final GetCatAmount getCatAmount = GetCatAmount();
  String exampleQuery = "/says/Hello World";
  late Future<Map<String, dynamic>> catMap;
  late Future<List<dynamic>> catTags;
  late Future<int> catAmount;
  String catUrl = "https://cataas.com";

  @override
  void initState() {
    catMap = getRandomCat.execute(exampleQuery);
    catTags = getTags.execute();
    catAmount = getCatAmount.execute();
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
                OpenBrowser.execute(Uri.parse('https://twitter.com/apicataas'));
              },
              icon: const Icon(FontAwesome.twitter)),
          IconButton(
              onPressed: () {
                OpenBrowser.execute(Uri(
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
                    const Text(
                      'A REST API to spread peace and love (or not) thanks to cats.',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    FutureBuilder(
                      future: catAmount,
                      builder: (context, snapshot) {
                        Text options;
                        if (snapshot.hasData) {
                          options = Text(
                            'Have ${snapshot.data} cats for now',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          );
                        } else {
                          options = const Text(
                            'Have 0 cats for now',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          );
                        }
                        return options;
                      },
                    )
                  ],
                )),
            GestureDetector(
                onTap: () {
                  OpenBrowser.execute(Uri.parse("https://cataas.com/#/upload"));
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
                  OpenBrowser.execute(Uri.parse(
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
              const CustomFormField(),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 48,
                margin: const EdgeInsets.symmetric(vertical: 50),
                child: Material(
                  color: ColorPalette.sucessColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    onTap: () {
                      setState(() {
                        catMap = getRandomCat.execute(exampleQuery);
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
                constraints: const BoxConstraints(minHeight: 175),
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
                                          backgroundColor:
                                              ColorPalette.sucessColor,
                                        ));
                                      },
                                      child: const Text('Copiar ID'))
                                ],
                              ),
                              //TODO Bota o texto real aqui dentro
                              const Text('Image Text: Hello World'),
                              Text(
                                  'Date of posting: ${GetFormattedDate.execute(snapshot.data!["body"]["created_at"])}'),
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
                                            OpenBrowser.execute(Uri.parse(
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
                                        text: GetOriginalImageUrl.execute(
                                            '$catUrl${snapshot.data!["body"]["url"]}'),
                                        style:
                                            TextStyle(color: Colors.blue[800]),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            OpenBrowser.execute(Uri.parse(
                                                GetOriginalImageUrl.execute(
                                                    '$catUrl${snapshot.data!["body"]["url"]}')));
                                          }),
                                  ])),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: TextButton(
                                      onPressed: () {
                                        Share.share(
                                          '$catUrl${snapshot.data!["body"]["url"]}',
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.share),
                                          Text(
                                            'Share',
                                          )
                                        ],
                                      )),
                                ),
                              )
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
