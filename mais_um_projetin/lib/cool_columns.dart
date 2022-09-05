import 'package:flutter/material.dart';

class CoolColumns extends StatefulWidget {
  const CoolColumns({Key? key}) : super(key: key);

  @override
  State<CoolColumns> createState() => _CoolColumnsState();
}

class _CoolColumnsState extends State<CoolColumns> {
  MainAxisAlignment finalColumnMainAlignment = MainAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    bool isVisibleBasedMainAlignment =
        finalColumnMainAlignment == MainAxisAlignment.center ||
            finalColumnMainAlignment == MainAxisAlignment.start ||
            finalColumnMainAlignment == MainAxisAlignment.end;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Testando Aparecer e Sumir Gap'),
      ),
      body: Center(
        child: SizedBox(
          width: screenSize.width,
          child: Column(
            mainAxisAlignment: finalColumnMainAlignment,
            children: [
              Container(
                color: Colors.pinkAccent,
                width: screenSize.width / 2,
                height: screenSize.width / 4,
              ),
              if (isVisibleBasedMainAlignment)
                const SizedBox(
                  height: 12,
                  width: 5,
                ),
              Container(
                  color: Colors.purple,
                  width: screenSize.width / 2,
                  height: screenSize.width / 4,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          finalColumnMainAlignment = finalColumnMainAlignment ==
                                  MainAxisAlignment.center
                              ? MainAxisAlignment.spaceAround
                              : MainAxisAlignment.center;
                        });
                      },
                      child: const Text(
                        'Mudar Alinhamento',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ))),
              if (isVisibleBasedMainAlignment)
                const SizedBox(
                  height: 12,
                  width: 5,
                ),
              Container(
                color: Colors.red,
                width: screenSize.width / 2,
                height: screenSize.width / 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
