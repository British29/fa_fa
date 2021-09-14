import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Parametres extends StatefulWidget {
  const Parametres({Key? key}) : super(key: key);

  @override
  _ParametresState createState() => _ParametresState();
}

class _ParametresState extends State<Parametres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parametres'),
        backgroundColor: HexColor('#e5e5e5'),
      ),
      body: Container(
        child: Text('Les differents paramètres de connexion'),
      ),
    );
  }
}
