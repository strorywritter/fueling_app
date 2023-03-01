import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

//hgdsjkfd

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(' Home Page'),
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu)),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.supervised_user_circle)),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
              child: Image.network(
                'https://st2.depositphotos.com/1104517/11965/v/950/depositphotos_119659092-stock-illustration-male-avatar-profile-picture-vector.jpg',
                height: 120,
              ),
            ),
            const Text(
              'User Name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              'V number',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            DropdownButton<String>(
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,

                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            )

          ],
        ),
      ),
    ));
  }
}
