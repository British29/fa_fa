import 'dart:convert';

import 'package:fa_fa/screens/acueil.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool visible = true;
  bool invalidUser = false;
  final _keyForm = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login() async {
    // SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    if (_keyForm.currentState!.validate()) {
      var url = Uri.parse("http://172.31.5.209/fafaMobile/login.php");
      var reponse = await http.post(url, body: {
        "login": "true",
        "email": email.text,
        "password": password.text,
      });
      var data = json.decode(reponse.body);
      if (data == "Success") {
        print('connexion reussi');
        Fluttertoast.showToast(
            msg: "Connexion reussie",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccueilPage(
                // id: data.id,
                ),
          ),
        );
        // sharedPrefs.setString('id', data[0]['id']);
      } else {
        print('erreur de connexion');
        Fluttertoast.showToast(
            msg: "Email ou mot de passe incorrect",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  Text(
                    'Connectez-vous',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 50, right: 50),
                    child: Container(
                      child: TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ce champs est vide';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline),
                            hintText: 'votre email'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 50, right: 50),
                    child: Container(
                      child: TextFormField(
                        controller: password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ce champs est vide';
                          }
                          return null;
                        },
                        autofocus: false,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          fillColor: Colors.red,
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Mot de passe',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              semanticLabel: _obscureText ? 'voir' : 'cacher',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: ButtonTheme(
                      buttonColor: Colors.blue,
                      minWidth: MediaQuery.of(context).size.width,
                      height: 55,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () {
                          login();
                        },
                        child: Text(
                          'Connexion',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  invalidUser
                      ? Text(
                          "Aucun compte trouvé",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      : SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
