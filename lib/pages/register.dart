import 'package:flutter/material.dart';
import 'package:fueling/pages/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String Name = '';
  String Password = '';
  String VehicleNumber = '';
  String Email = '';

  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? name;
  TextEditingController? vNum;

  // controllers
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    vNum = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight:  FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 5),
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        hintText: ' Enter your name', labelText: 'Email'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 5),
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        hintText: 'Enter your password', labelText: 'Password'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 5),
                  child: TextFormField(
                    controller: vNum,
                    decoration: InputDecoration(
                        hintText: ' Enter your Vehicle Number',
                        labelText: 'Vehicle Number'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 5),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        hintText: 'Enter your email', labelText: 'Email'),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      print("click");
                      if (!email!.text.isEmpty || !password!.text.isEmpty || !vNum!.text.isEmpty || !name!.text.isEmpty) {
                        Email = email!.text.toString();
                        Password = password!.text.toString();
                        Name = name!.text.toString();
                        VehicleNumber = vNum!.text.toString();
                        print('$Email $Password $VehicleNumber $Name type answer');
                      }
                    },
                    child: Text("Register")),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    child: Text('Sign In', style: TextStyle(),),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Login()));
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
