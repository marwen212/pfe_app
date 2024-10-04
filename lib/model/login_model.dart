class LoginResponseModel {
  final String api_token;
  final String msg;

  LoginResponseModel({this.api_token, this.msg});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      api_token: json["api_token"] != null ? json["api_token"] : "",
      msg: json["msg"] != null ? json["msg"] : "",
    );
  }
}

class LoginRequestModel {
  String login;
  String password;

  LoginRequestModel({
    this.login,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'login': login.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
