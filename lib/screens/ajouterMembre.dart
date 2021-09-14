// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';

// class AjoutNewMembre extends StatefulWidget {
//   final String idCoop;

//   AjoutNewMembre({required this.idCoop});

//   @override
//   _AjoutNewMembreState createState() => _AjoutNewMembreState();
// }

// class _AjoutNewMembreState extends State<AjoutNewMembre> {
//   @override
//   Widget build(BuildContext context) {
//     print(widget.idCoop);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor('#10A650'),
//         automaticallyImplyLeading: false,
//         title: Center(
//           child: Text(""),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Form(
//             child: Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   'Inscription',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 40),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
//                   child: Container(
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Ajouter un nom et prenoms';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.person),
//                           hintText: 'Nom & Prénoms'),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
//                   child: Container(
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Ajouter une addresse email';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.alternate_email_sharp),
//                           hintText: 'Adresse Email'),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
//                   child: Container(
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Ajouter un numéro';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.phone_android),
//                           hintText: 'Numéro de Telephone'),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 70,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30, right: 30),
//                   child: ButtonTheme(
//                       buttonColor: Colors.blueAccent,
//                       minWidth: MediaQuery.of(context).size.width,
//                       height: 55,
//                       // ignore: deprecated_member_use
//                       child: RaisedButton(
//                         onPressed: () {
//                           // inscription();
//                         },
//                         child: Text(
//                           "Enregistrer",
//                           style: TextStyle(color: Colors.white, fontSize: 30),
//                         ),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25)),
//                       )),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
