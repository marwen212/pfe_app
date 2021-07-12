import 'package:flutter/material.dart';
class Reclamationpage extends StatelessWidget {
  static String tag = 'reclamation-page';

  @override
  Widget build(BuildContext context) {
    final sujet = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'SUJET :',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );

    final Sujet = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'veuiller ecrire le sujet',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final message = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'MESSAGE :',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );

    final Message = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Veuiller ecrire votre message',
        contentPadding: EdgeInsets.fromLTRB(20.0, 65.0, 60.0,80.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );


    /* final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );*/


    final ReclamationButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(Reclamationpage.tag);
        },
        padding: EdgeInsets.all(15.0),

        color: Colors.white,
        child: Text('ENVOYER',
            style: TextStyle (
              color: Color(0xFF527DAA) ,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              letterSpacing: 1.5,
            )

        ),
      ),
    );


    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[

            sujet,
            SizedBox(height: 8.0),

            SizedBox(height: 8.0),

            Sujet,
            SizedBox(height: 8.0),

            SizedBox(height: 24.0),
            message,

            SizedBox(height: 8.0),

            SizedBox(height: 8.0),

            Message,
            SizedBox(height: 8.0),


            SizedBox(height: 50),

            ReclamationButton,


          ],
          //alucard,
          //
          //lorem
        ),
      ),
    );
  }

}



