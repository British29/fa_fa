import 'dart:convert';

import 'package:fa_fa/models/cooperative.dart';
import 'package:fa_fa/models/cooperatives.dart';
import 'package:fa_fa/models/detailsCooperatives.dart';
import 'package:http/http.dart' as http;

Future<List<CooperativeData>> fetchCooperatives() async {
  var url =
      Uri.parse("http://192.168.1.135/fafaMobile/affichageCooperative.php");
  var reponse = await http.get(url);

  if (reponse.statusCode == 200) {
    final items = json.decode(reponse.body).cast<Map<String, dynamic>>();

    List<CooperativeData> cooperative = items.map<CooperativeData>((json) {
      return CooperativeData.fromJson(json);
    }).toList();

    return cooperative;
  } else {
    throw Exception('Échec du chargement des données depuis le serveur');
  }
}

Future<List<AllCooperativeData>> fetchAllCooperativeData() async {
  var url =
      Uri.parse("http://172.31.5.209/fafaMobile/affichageCooperative.php");
  var reponse = await http.get(url);

  if (reponse.statusCode == 200) {
    final items = json.decode(reponse.body).cast<Map<String, dynamic>>();

    List<AllCooperativeData> cooPerativeListe =
        items.map<AllCooperativeData>((json) {
      return AllCooperativeData.fromJson(json);
    }).toList();

    return cooPerativeListe;
  } else {
    throw Exception('Échec du chargement des données depuis le serveur');
  }
}

Future<List<CooperativeDetailsData>> fetchCooperativeDetailsData() async {
  var url = Uri.parse(
      "http://192.168.1.135/fafaMobile/affichageCooperativeDetails.php");
  var reponse = await http.get(url);

  if (reponse.statusCode == 200) {
    final items = json.decode(reponse.body).cast<Map<String, dynamic>>();

    List<CooperativeDetailsData> cooperativeDetails =
        items.map<CooperativeDetailsData>((json) {
      return CooperativeDetailsData.fromJson(json);
    }).toList();

    return cooperativeDetails;
  } else {
    throw Exception('Échec du chargement des données depuis le serveur');
  }
}
