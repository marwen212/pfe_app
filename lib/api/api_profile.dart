import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/profile_model.dart';
import '../model/personne_model.dart';
import 'package:association/api/api_service.dart';
import 'package:association/model/login_model.dart';
import 'package:association/screens/login_page.dart';

class APIprofileService {
  APIService apiService = new APIService();
/*    Future<Profile> getUsers() async {
    var url = Uri.parse("http://192.168.1.10:8000/api/admin/profile");

    final response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return DataModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  } */
  final String profileURL = "http://192.168.1.7:8000/api/admin/profile";

  Future<Profile> getProfile() async {
    final response =
    await http.get(profileURL, headers: {'auth-token': LoginPage.token});

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      return Profile.fromJson(body);
    } else {
      throw "Failed to load data!";
    }
  }

  Future<Personne> getPersonneByCheque(String qrCode) async {
    final String personneByChequeURL =
        "http://192.168.1.7:8000/api/admin/get-personne-bycheque/$qrCode";
    debugPrint("GET_PERSONNE URL : $personneByChequeURL");
    var head = new Map<String, String>();
    head['auth-token'] = LoginPage.token;
    try {
      final response =
      await http.get(Uri.parse(personneByChequeURL), headers: head);
      final body = await jsonDecode(response.body);
      debugPrint("GET_PERSONNE Body : $body");
      if (body['status'] == true) {
        debugPrint("GET_PERSONNE id : " + body['id'].toString());
        debugPrint("GET_PERSONNE cin :" + body['CIN'].toString());

        return Personne.fromJson(body);
      } else {
        debugPrint("GET_PERSONNE HTTP_EXCEPTION : $body");
        return Personne.fromJson(body);
      }
    } catch (error) {
      var msg = error.toString();
      debugPrint("GET_PERSONNE Error ${error.toString()}");
      return throw "$msg";
    }
  }

  _setHeaders() => {
    'auth-token': LoginPage.token,
  };
}
