import 'package:flutter/material.dart';
import 'package:projeto_de_testes/slide.dart';

class CarrosselPage extends StatefulWidget {
  const CarrosselPage({Key? key}) : super(key: key);

  @override
  State<CarrosselPage> createState() => _CarrosselPageState();
}

class _CarrosselPageState extends State<CarrosselPage> {
  int _currentPage = 0;
  final PageController _slidesController =
      PageController(viewportFraction: 0.9);
  final List<Slide> listSlides = const [
    Slide(
      imagePath: 'assets/images/berti.jpg',
      titulo: 'Bruno Berti, Trabalho da Feira Cultural, Circa 2019',
      cor: Colors.amber,
    ),
    Slide(
      imagePath: 'assets/images/cass.png',
      titulo: 'Poster do Cassidy, Último Trabalho de Photoshop, 2019',
      cor: Colors.red,
    ),
    Slide(
      imagePath: 'assets/images/jojo.png',
      titulo: 'Jojo Hype, Trabalho de Photoshop, 2019',
      cor: Colors.blue,
    ),
    Slide(
      imagePath: 'assets/images/lua.png',
      titulo:
          'Chegada à Lua, Trabalho de Photoshop da Thefi, feito por mim, 2019',
      cor: Colors.purple,
    ),
    Slide(
      imagePath: 'assets/images/rambo.jpg',
      titulo:
          'Poster do Rambo, destinado às academias. Trabalho de Photoshop, 2019',
      cor: Colors.yellow,
    ),
  ];
  @override
  void initState() {
  int nextPage = 0;
    _slidesController.addListener(() {
      nextPage = _slidesController.page!.round();
      print(nextPage);
      if (_currentPage != nextPage) {
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrossel do Rafinha'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height -
                      kToolbarHeight -
                      MediaQuery.of(context).padding.top) *
                  0.9,
              // color: Colors.green,
              child: PageView.builder(
                itemCount: listSlides.length,
                controller: _slidesController,
                itemBuilder: (BuildContext context, int index) {
                  bool activePage = index == _currentPage;
                  // print("index :" + index.toString());
                  // print("currentPage :" + _currentPage.toString());
                  // print("Active Page :" + activePage.toString());
                  return Slide(
                    imagePath: listSlides[index].imagePath,
                    titulo: listSlides[index].titulo,
                    cor: listSlides[index].cor,
                    activePage: !activePage
                  );
                },
              ),
            ),
            _circulosIndex()
          ],
        ),
      ),
      drawer: Drawer(
          backgroundColor: Colors.black87,
          elevation: 200,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    width: constraints.maxWidth,
                    height: 80,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.orange, width: 5)),
                  );
                },
              );
            },
          )),
    );
  }

  Widget _circulosIndex() {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: (MediaQuery.of(context).size.height -
                  kToolbarHeight -
                  MediaQuery.of(context).padding.top) *
              0.1,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: listSlides.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: _currentPage == index ? listSlides[index].cor : Colors.grey),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
