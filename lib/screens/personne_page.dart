import 'package:flutter/material.dart';
import 'validation_page.dart';

class Personnepage extends StatelessWidget {
  static String tag = 'personne-page';

  @override
  Widget build(BuildContext context) {
    final Nom1 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Nom :',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
    final Prenom1 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Prenom :',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
    final SoldeRestant1 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Solde :',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
    final tel = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Telephone :',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
    final validite = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Validité :',
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
    final Montant = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Montant a payer',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final ScanButton = Padding(
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
        child: Text('PAYER',
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
            SizedBox(height: 50.0),
            Montant,
            SizedBox(height: 8.0),
            Nom1,
            SizedBox(height: 8.0),
            SizedBox(height: 8.0),
            Prenom1,
            SizedBox(height: 8.0),
            SizedBox(height: 8.0),
            SoldeRestant1,
            SizedBox(height: 8.0),
            SizedBox(height: 8.0),
            tel,
            SizedBox(height: 8.0),
            SizedBox(height: 8.0),
            validite,
            SizedBox(height: 8.0),
            SizedBox(height: 24.0),
            ScanButton,
          ],
          //alucard,
          //
          //lorem
        ),
      ),
    );
  }
}
