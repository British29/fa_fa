import 'dart:convert';

import 'package:fa_fa/models/membres.dart';
import 'package:fa_fa/screens/listecooperative.dart';
import 'package:fa_fa/screens/membre.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class ListeDesMembres extends StatefulWidget {
  final String id;
  final String nomCooperative;

  ListeDesMembres({required this.id, required this.nomCooperative});

  @override
  _ListeDesMembresState createState() => _ListeDesMembresState();
}

class _ListeDesMembresState extends State<ListeDesMembres> {
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController numero = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  Future ajouterChambre() async {
    if (_keyForm.currentState!.validate()) {
      var url = Uri.parse("http://192.168.1.135/fafaMobile/ajouterMembre.php");
      var response = await http.post(url, body: {
        "idCooperative": widget.id,
        "nom": nom.text,
        "prenom": prenom.text,
        "numero": numero.text,
      });

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Enregistrer avec succès",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 0,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Listescooperative(),
          ),
        );
      } else {
        Fluttertoast.showToast(
            msg: "Pas Enregistrer",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 0,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  Future<List<MembreData>> fetchMembres() async {
    var url = Uri.parse(
        "http://172.31.5.209/fafaMobile/affichageMembre.php?idCooperative=${widget.id}");

    var reponse = await http.get(url);

    if (reponse.statusCode == 200) {
      final items = json.decode(reponse.body).cast<Map<String, dynamic>>();

      List<MembreData> membreListe = items.map<MembreData>((json) {
        return MembreData.fromJson(json);
      }).toList();

      return membreListe;
    } else {
      throw Exception('Échec du chargement des données depuis le serveur');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.nomCooperative),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_circle,
              color: Colors.white,
              size: 33,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                      'Ajouter un membre à ' + ' ' + widget.nomCooperative),
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.40,
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _keyForm,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 40, right: 40),
                              child: Container(
                                child: TextFormField(
                                  controller: nom,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Ajouter un nom';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      hintText: 'Entrer un nom'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 40, right: 40),
                              child: Container(
                                child: TextFormField(
                                  controller: prenom,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Ajouter un prenom';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      hintText: 'Entrer un prenom'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 40, right: 40),
                              child: Container(
                                child: TextFormField(
                                  controller: numero,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Ajouter un numéro';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.phone),
                                      hintText: 'Entrer un numero'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Annuler',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ajouterChambre();
                      },
                      child: Text(
                        'ajouter',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
        backgroundColor: HexColor('#10A650'),
      ),
      body: FutureBuilder<List<MembreData>>(
        future: fetchMembres(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data!
                .map((data) => Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            data.nom + ' ' + data.prenom,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MembresDetails(
                                  id: data.id,
                                ),
                              ),
                            );
                          },
                        ),
                        Divider(
                          color: Colors.black26,
                          endIndent: 10.0,
                          indent: 10.0,
                        ),
                      ],
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
