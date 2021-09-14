import 'package:fa_fa/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Spash extends StatefulWidget {
  @override
  _SpashState createState() => _SpashState();
}

class _SpashState extends State<Spash> {
  @override
  void initState() {
    var d = Duration(seconds: 2);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) {
          return LoginPage();
        }),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#10A650"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Container(
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.70,
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Image.asset('assets/images/logoCoop.png'),
                ),
              ),
            ),
          ),
          Text(
            'Cooperative mobile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CircularProgressIndicator(
            strokeWidth: 3,
            backgroundColor: Colors.white,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ],
      ),
    );
  }
}
