import 'package:flutter/material.dart';

class Validationpage extends StatelessWidget {
  static String tag = 'validation-page';
  @override
  Widget build(BuildContext context) {
    final Solde = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Solde :',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
    final Montant = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Montant :',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
    final SoldeRestant1 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Reste :',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
    final Codepin = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Code pin',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final ValidButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(Validationpage.tag);
        },
        padding: EdgeInsets.all(15.0),
        color: Colors.white,
        child: Text('Valider',
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
      backgroundColor: Colors.lightBlue.shade50,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Solde,
            SizedBox(height: 8.0),
            Montant,
            SizedBox(height: 8.0),
            SizedBox(height: 8.0),
            SoldeRestant1,
            SizedBox(height: 8.0),
            Codepin,
            SizedBox(height: 8.0),
            SizedBox(height: 8.0),
            SizedBox(height: 24.0),
            ValidButton,
          ],
          //alucard,
          //
          //lorem
        ),
      ),
    );
  }
}
