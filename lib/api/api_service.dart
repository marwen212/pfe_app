import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    var url = Uri.parse('http://192.168.1.7:8000/api/admin/login');
    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
