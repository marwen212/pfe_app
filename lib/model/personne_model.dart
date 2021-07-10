import 'package:flutter/foundation.dart';
import 'dart:convert';

class Personne{
  final String nom;
  final String prenom;
  final String CIN;
  final String tel;
  final String adresse;
  final String validite;
  final double solde;
  Personne({
    @required this.nom,
    @required this.prenom,
    @required this.CIN,
    @required this.tel,
    @required this.adresse,
    @required this.validite,
    @required this.solde,
  });

  factory Personne.fromJson(Map<String, dynamic> json) {
    return Personne(
      nom: json['nom'],
      prenom: json['prenom'] as String,
      CIN: json['CIN'].toString(),
      tel: json['tel'].toString(),
      validite: json['validité'] as String,
      adresse: json['adresse'] as String,
      solde:
      json['solde'] == null ? 0.0 : double.parse(json['solde'].toString()),
    );
  }
}
