import 'package:association/api/api_profile.dart';
import 'package:association/model/personne_model.dart';
import 'package:flutter/material.dart';
import 'validation_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Personnepage extends StatefulWidget {
  static String tag = 'personne-page';
  final qrCode;
  const Personnepage({Key key, this.qrCode}) : super(key: key);

  @override
  _PersonnepageState createState() => _PersonnepageState();
}

class _PersonnepageState extends State<Personnepage> {
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final soldeController = TextEditingController();
  final tlfController = TextEditingController();
  final validController = TextEditingController();
  final montantController = TextEditingController();
  var init = true;
  var loading = true;
  var profileAPI = APIprofileService();
  Personne personne = Personne(
      nom: "",
      prenom: "",
      CIN: "",
      tel: "",
      adresse: "",
      validite: "",
      solde: 0);
  @override
  void didChangeDependencies() {
    nomController.text = "Nom :";
    prenomController.text = "Prenom :";
    soldeController.text = "Solde :";
    tlfController.text = "Telephone :";
    validController.text = "Validité :";
    if (init) {
      getPersonne();
      setState(() {
        init = false;
      });
    }
    super.didChangeDependencies();
  }

  void getPersonne() {
    try {
      profileAPI.getPersonneByCheque(widget.qrCode).then((value) {
        setState(() {
          this.personne = value;
          loading = false;
        });

        nomController.text = "Nom : ${this.personne.nom}";
        prenomController.text = "Prenom : ${this.personne.prenom}";
        soldeController.text = "Solde : ${this.personne.solde}";
        tlfController.text = "Telephone : ${this.personne.tel}";
        validController.text = "Validité : ${this.personne.validite}";
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Nom1 = Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        readOnly: true,
        controller: nomController,
        decoration: InputDecoration.collapsed(
          border: InputBorder.none,
        ),
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
    final Prenom1 = Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        readOnly: true,
        controller: prenomController,
        decoration: InputDecoration.collapsed(
          border: InputBorder.none,
        ),
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
    final SoldeRestant1 = Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        readOnly: true,
        controller: soldeController,
        decoration: InputDecoration.collapsed(
          border: InputBorder.none,
        ),
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
    final tel = Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        readOnly: true,
        controller: tlfController,
        decoration: InputDecoration.collapsed(
          border: InputBorder.none,
        ),
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
    final validite = Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        readOnly: true,
        controller: validController,
        decoration: InputDecoration.collapsed(
          border: InputBorder.none,
        ),
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
    final Montant = Form(
        key: _formKey,
        child:TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          controller: montantController,
          decoration: InputDecoration(
            hintText: 'Montant a payer',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
          validator: (value) {
            if (value.isEmpty ) {
              return "Entrer le montant";
            }
            return null;
            },
    ));

    final ScanButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          _submit();
          //Navigator.of(context).pushNamed(Validationpage.tag);
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
        child: Stack(
          children: [
            ListView(
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
            if (loading) Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    // Navigator.of(context).pushNamed(ScanScreen.nameRoute);
    setState(() {
      loading = true;
    });
    try {
      profileAPI.payer(double.parse(montantController.text.toString())).then((value) {
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
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
          );
          Navigator.of(context).pushNamed(Validationpage.tag);
        }
        else{
          Fluttertoast.showToast(
            msg: "Echec",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.grey,
            gravity: ToastGravity.CENTER,
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