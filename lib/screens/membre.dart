import 'dart:convert';

import 'package:fa_fa/models/membresDetails.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class MembresDetails extends StatefulWidget {
  final String id;

  MembresDetails({required this.id});

  @override
  _MembresDetailsState createState() => _MembresDetailsState();
}

class _MembresDetailsState extends State<MembresDetails> {
  Future<List<MembreDetailsData>> fetchMembresDetails() async {
    var url = Uri.parse(
        "http://172.31.5.209/fafaMobile/affichageMembreDetails.php?id=${widget.id}");
    var reponse = await http.get(url);

    if (reponse.statusCode == 200) {
      final items = json.decode(reponse.body).cast<Map<String, dynamic>>();

      List<MembreDetailsData> membreDetailsListe =
          items.map<MembreDetailsData>((json) {
        return MembreDetailsData.fromJson(json);
      }).toList();

      return membreDetailsListe;
    } else {
      throw Exception('Échec du chargement des données depuis le serveur');
    }
  }

  @override
  Widget build(BuildContext context) {
    //Le print affiche l'identifiant recuperer sur la page listeMembre.dart
    print(widget.id);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("Details sur un membre"),
        ),
        backgroundColor: HexColor('#10A650'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    maxRadius: 50,
                    child: Icon(
                      Icons.person,
                      size: 70.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              width: double.infinity,
            ),
            Expanded(
              child: FutureBuilder<List<MembreDetailsData>>(
                future: fetchMembresDetails(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  // affiche un spinner de chargement...
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  // Rendre la liste d'un membre
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = snapshot.data[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'NOM',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              trailing: data.nom == ''
                                  ? Text(
                                      'Non renseignée',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                      ),
                                    )
                                  : Text(
                                      '${data.nom}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21,
                                          color: Colors.blue),
                                    ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              title: Text(
                                'PRENOMS',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              trailing: data.prenom == ''
                                  ? Text(
                                      'Non renseignée',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                      ),
                                    )
                                  : Text(
                                      '${data.prenom}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21,
                                          color: Colors.blue),
                                    ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              title: Text(
                                'NUMERO',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              trailing: data.numero == ''
                                  ? Text(
                                      'Non renseignée',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                      ),
                                    )
                                  : Text(
                                      '${data.numero}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21,
                                          color: Colors.blue),
                                    ),
                            ),
                          ],
                        ),
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
