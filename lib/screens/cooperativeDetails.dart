import 'package:fa_fa/models/detailsCooperatives.dart';
import 'package:fa_fa/services/api.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CooperativesDetails extends StatefulWidget {
  final String id;
  CooperativesDetails({required this.id});

  @override
  _CooperativesDetailsState createState() => _CooperativesDetailsState();
}

class _CooperativesDetailsState extends State<CooperativesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Details Cooperatives")),
        backgroundColor: HexColor('#10A650'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<CooperativeDetailsData>>(
              future: fetchCooperativeDetailsData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();

                return ListView(
                  children: snapshot.data!
                      .map((data) => Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  'DESIGNATION',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                trailing: Text(
                                  data.designation,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'REGISTRE',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                trailing: Text(
                                  data.numRegis,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'ADRESSE',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                trailing: Text(
                                  data.adresse,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
