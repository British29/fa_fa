import 'package:fa_fa/screens/listecooperative.dart';
import 'package:fa_fa/screens/login.dart';
import 'package:fa_fa/screens/parametres.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccueilPage extends StatefulWidget {



  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  void initState() {
    super.initState();
  }

  void logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Déconnexion'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Voulez vous vraiment vous déconnecter ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Oui',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                logout();
              },
            ),
            TextButton(
              child: Text('Non'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[200],
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Row(
                children: <Widget>[
                  ButtonTheme(
                    // ignore: deprecated_member_use
                    child: OutlineButton(
                      highlightedBorderColor: Colors.green,
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Listescooperative(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.33,
                        child: Center(
                          child: Icon(
                            Icons.holiday_village_outlined,
                            size: 120,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Spacer(),
                  ButtonTheme(
                    // ignore: deprecated_member_use
                    child: OutlineButton(
                      highlightedBorderColor: Colors.black,
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Parametres(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.33,
                        child: Center(
                          child: Icon(
                            Icons.settings,
                            size: 120,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Row(
                children: <Widget>[
                  ButtonTheme(
                    // ignore: deprecated_member_use
                    child: OutlineButton(
                      highlightedBorderColor: Colors.black,
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                      onPressed: () {
                        _showMyDialog();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.33,
                        child: Center(
                          child: Icon(
                            Icons.login_rounded,
                            size: 120,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
