import 'dart:core';

import 'package:fa_fa/models/cooperative.dart';
import 'package:fa_fa/screens/listeMembre.dart';
import 'package:fa_fa/services/api.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Listescooperative extends StatefulWidget {
  @override
  _ListescooperativeState createState() => _ListescooperativeState();
}

class _ListescooperativeState extends State<Listescooperative> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       showSearch(
        //         context: context,
        //         delegate: CooperativeSearch(fetchAllCooperativeData),
        //       );
        //     },
        //     icon: Icon(Icons.search),
        //   )
        // ],
        title: Center(child: Text("La Listes des Cooperatives")),
        backgroundColor: HexColor('#10A650'),
      ),
      body: FutureBuilder<List<AllCooperativeData>>(
        future: fetchAllCooperativeData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data!
                .map(
                  (data) => InkWell(
                    onTap: () {
                      // print(data.id);
                      // print(data.designation);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListeDesMembres(
                            id: data.id,
                            nomCooperative: data.designation,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.all(5),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data.designation,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  data.numRegis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  data.adresse,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
