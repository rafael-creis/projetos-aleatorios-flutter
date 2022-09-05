import 'package:flutter/material.dart';

class Slide extends StatefulWidget {
  final String imagePath;
  final String titulo;
  final Color cor;
  final bool? activePage;

  const Slide(
      {Key? key,
      required this.imagePath,
      required this.titulo,
      required this.cor,
      this.activePage})
      : super(key: key);

  @override
  State<Slide> createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  
  late double activeHeight = widget.activePage! ? 1 : 0.8;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return AnimatedContainer(
          height: constraints.maxHeight * activeHeight,
          curve: Curves.easeIn,
          margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
          duration: const Duration(milliseconds: 500),
          child: Column(
            children: [
              Container(
                height: (constraints.maxHeight * 0.7) * activeHeight,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                    border: Border.all(color: widget.cor, width: 5)),
                child: Image(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: ((constraints.maxHeight * 0.2) - 5) *activeHeight,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    border: Border.all(color: widget.cor, width: 5)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.titulo,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
