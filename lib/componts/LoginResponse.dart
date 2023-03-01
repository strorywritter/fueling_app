import 'dart:convert';

class LoginResponse {
  final bool loginStatus;
  final String userId;
  final String userName;
  final String userRole;

  LoginResponse(this.loginStatus, this.userId, this.userName, this.userRole);

  factory LoginResponse.fromJson(Map<String, dynamic> json){
    return LoginResponse(
        json["loginStatus"],
        json["userId"],
        json["userName"],
        json["userRole"]);
  }

}
