/* class DataModel {
  List<UserModel> data;

  DataModel({
    this.data,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        data:
            (json["data"] as List).map((i) => UserModel.fromJson(i)).toList());
  }
}

class UserModel {
  final String firstName;
  final String lastName;

  UserModel({
    this.firstName,
    this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['nom_marchand'],
      lastName: json['prenom_marchand'],
    );
  }
}
 */
import 'package:flutter/foundation.dart';
import 'dart:convert';

class Profile {
  final String nom_marchand;
  final String prenom_marchand;
  final String CIN;
  final String tel;
  final String adresse_marchand;
  final double solde;
  final String validite;
  Profile({
    @required this.nom_marchand,
    @required this.prenom_marchand,
    @required this.CIN,
    @required this.tel,
    @required this.adresse_marchand,
    @required this.solde,
    this.validite
  });



  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      nom_marchand: json['nom_marchand'],
      prenom_marchand: json['prenom_marchand'] as String,
      CIN: json['CIN'].toString(),
      tel: json['tel'].toString(),
      adresse_marchand: json['adresse_marchand'] as String,
      solde: json['solde'] == null ? 0.0 : double.parse(json['solde'].toString()),
        validite: json['valdité'] == null ? 0.0 : json['valdité'].toString(),
    );
  }
}
