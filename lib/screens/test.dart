import 'dart:convert';

import 'package:fa_fa/models/membres.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HistoriquePage extends StatefulWidget {
  @override
  _HistoriquePageState createState() => _HistoriquePageState();
}

class _HistoriquePageState extends State<HistoriquePage> {
  Future<List<MembreData>> fetchMembres() async {
    var url = Uri.parse("http://172.31.5.209/fafaMobile/affichageMembre.php");

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
        backgroundColor: HexColor('#037243'),
        title: Text('Mon historique'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green[200],
                    maxRadius: 40,
                    child: Icon(
                      Icons.person,
                      size: 60.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'dddd',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              width: double.infinity,
            ),
            Center(
              child: FutureBuilder<List<MembreData>>(
                future: fetchMembres(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  // By default, show a loading spinner.
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  // Render student lists
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = snapshot.data[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              'DESIGNATION',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            trailing: Text(
                              data.nom,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'PRENOMS',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            trailing: Text(
                              data.prenom,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'NUMERO',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            trailing: Text(
                              data.numero,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
