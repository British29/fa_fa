import 'package:fa_fa/models/cooperatives.dart';
import 'package:fa_fa/screens/cooperativeDetails.dart';
import 'package:fa_fa/services/api.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ListesCooperatives extends StatefulWidget {
  @override
  _ListesCooperativesState createState() => _ListesCooperativesState();
}

class _ListesCooperativesState extends State<ListesCooperatives> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("La Listes des Cooperatives")),
        backgroundColor: HexColor('#10A650'),
      ),
      body: FutureBuilder<List<CooperativeData>>(
        future: fetchCooperatives(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data!
                .map(
                  (data) => Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          data.designation,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        trailing: Icon(Icons.arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CooperativesDetails(
                                id: data.id,
                              ),
                            ),
                          );
                        },
                      ),
                      Divider(
                        color: Colors.black,
                        endIndent: 10.0,
                        indent: 10.0,
                      ),
                    ],
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
