import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fueling/pages/home.dart';
import 'package:fueling/pages/register.dart';

import '../componts/LoginRequest.dart';
import '../componts/LoginResponse.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String Email = '';
  String Password = '';
  TextEditingController? email;
  TextEditingController? password;

  // controllers
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
    password?.dispose();
  }

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final response = await http.post(Uri.parse("jahdfjsdjf"),
        body: jsonEncode(loginRequest));

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('filed login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fueling'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Container(
            child: Column(
              children: [
                const Text(
                  'Sgin In',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 5),
                  child: TextFormField(
                    controller: email,
                    decoration:
                        InputDecoration(hintText: 'Email', labelText: 'Email'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 5),
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        hintText: 'password', labelText: 'Password'),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      print("click");
                      if (!email!.text.isEmpty || !password!.text.isEmpty) {
                        Email = email!.text.toString();
                        Password = password!.text.toString();
                        print('$Email $Password type answer');
                        login(LoginRequest(email: Email, password: Password));
                      }
                    },
                    child: Text("Login")),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    child: Text(
                      'Create Account',
                      style: TextStyle(),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    child: Text(
                      'Home Page',
                      style: TextStyle(),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
