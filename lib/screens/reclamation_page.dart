import 'package:association/api/api_reclamation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Reclamationpage extends StatefulWidget {
  static String tag = 'reclamation-page';

  @override
  _ReclamationpageState createState() => _ReclamationpageState();
}

class _ReclamationpageState extends State<Reclamationpage> {
  final sujetController = TextEditingController();
  final msgController = TextEditingController();
  static GlobalKey<FormState> _sujetKey = new GlobalKey<FormState>();
  static GlobalKey<FormState> _msgKey = new GlobalKey<FormState>();
  var reclamationAPI = APIReclamation();
  var loading = false;
  @override
  Widget build(BuildContext context) {
    final sujet = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'SUJET :',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );

    final Sujet =  Form(
        key: _sujetKey,
        child:TextFormField(
      keyboardType: TextInputType.text,
      controller: sujetController,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Veuiller ecrire le sujet',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
          validator: (value) {
            if (value.isEmpty ) {
              return "Entrer le sujet";
            }
            return null;
          },
        )
    );

    final message = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'MESSAGE :',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );

    final Message = Form(
        key: _msgKey,
        child:TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: msgController,
      decoration: InputDecoration(
        hintText: 'Veuiller ecrire votre message',
        contentPadding: EdgeInsets.fromLTRB(20.0, 65.0, 60.0,80.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
          validator: (value) {
            if (value.isEmpty ) {
              return "Entrer le message";
            }
            return null;
          },
    ));


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
          _submit();
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
        child: Stack(
          children:[
            ListView(
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

              if (loading) Center(child: CircularProgressIndicator())
            ],
            //alucard,
            //
            //lorem
          ),
  ]
        ),
      ),
    );
  }
  Future<void> _submit() async {
    if (!_sujetKey.currentState.validate() || !_msgKey.currentState.validate() ) {
      // Invalid!
      return;
    }
    _sujetKey.currentState.save();
    _msgKey.currentState.save();
    // Navigator.of(context).pushNamed(ScanScreen.nameRoute);
    setState(() {
      loading = true;
    });
    try {
      await reclamationAPI.postRecalamtion(sujetController.text.toString(),msgController.text.toString()).then((value) {
        setState(() {
          loading = false;
        });
        /* setState(() {
          this.personne = value;
          loading = false;
        });*/
        if(value) {
          Fluttertoast.showToast(
            msg: "Succès",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.green,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
          );
          //Navigator.of(context).pushNamed(Validationpage.tag);
        }
        else{
          Fluttertoast.showToast(
            msg: "Echec",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.grey,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
          );
        }
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      Fluttertoast.showToast(
        msg: "Echec",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.grey,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
      );
    }

    setState(() {
      loading = false;
    });
  }
}



