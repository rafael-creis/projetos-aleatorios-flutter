import 'package:flutter/material.dart';

class Authors extends StatelessWidget {

  const Authors({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Cat As A Service'), backgroundColor: Theme.of(context).primaryColor,),
           body: Container(),
       );
  }
}