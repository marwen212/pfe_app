import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/profile_model.dart';
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
  final String profileURL = "http://192.168.1.10:8000/api/admin/profile";

  Future<Profile> getProfile() async {
    final response =
        await http.get(profileURL, headers: {'auth-token': LoginPage.token});

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      return  Profile.fromJson(body);
    } else {
      throw "Failed to load data!";
    }
  }

  _setHeaders() => {
        'auth-token': LoginPage.token,
      };
}
