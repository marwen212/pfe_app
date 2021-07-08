import 'package:association/model/profile_model.dart';
import 'package:association/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:association/screens/scan_qr_code.dart';
import 'package:association/api/api_profile.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final APIprofileService httpService = APIprofileService();

  Profile profile = Profile(
      nom_marchand: "",
      prenom_marchand: "",
      CIN: "",
      tel: "",
      adresse_marchand: "",
      solde: 0);

  @override
  void initState() {
    super.initState();
    APIprofileService().getProfile().then((value) {
      setState(() {
        this.profile = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /* final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/alucard.jpg'),
        ),
      ),
    );*/
    final Solde = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '                                                                                                    Solde :',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
    final Nom1 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Nom : ' + profile.nom_marchand,
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
    final gsm = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'GSM :' + profile.tel,
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
    final Prenom1 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Prenom :' + profile.prenom_marchand,
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
    /* final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );*/

    final ScanButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: RaisedButton(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ScanQRCode()));
        },
        padding: EdgeInsets.all(15.0),
        color: Colors.white,
        child: Text('SCAN',
            style: TextStyle(
              color: Color(0xFF527DAA),
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              letterSpacing: 1.5,
            )),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade800,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 40.0),
            Solde,
            Nom1,
            SizedBox(height: 8.0),
            SizedBox(height: 8.0),
            Prenom1,
            SizedBox(height: 8.0),
            SizedBox(height: 8.0),
            gsm,
            SizedBox(height: 8.0),
            ScanButton
          ],
          //alucard,
          //
          //lorem
        ),
      ),
    );
  }
}
