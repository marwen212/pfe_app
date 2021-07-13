import 'package:association/screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class APIReclamation {
  Future<bool> postRecalamtion(String sujet, String msg) async {
    const url = "http://192.168.1.7:8000/api/admin/reclamation";
    var map = new Map<String, String>();
    map['sujet'] = sujet.toString();
    map['message'] = msg.toString();
    var head = new Map<String, String>();
    head['auth-token'] = LoginPage.token;
    debugPrint("POST_RECLAMATION POST");
    try {
      final response = await http.post(Uri.parse(url), body: map,headers: head);
      final body = jsonDecode(response.body);
      debugPrint("POST_RECLAMATION ${body['status']}");
      if (body['status'] == true)
        return true;
      else
        return false;
    }
    catch (error) {
      return false;
    }
  }
}
