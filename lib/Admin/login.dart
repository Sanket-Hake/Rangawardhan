import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'adminHome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _email;
  late String _password;
  @override
  Widget build(BuildContext context) {
    final double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.15),
            Container(
              height: 100,
              width: 100,
              child: Image(
                image: AssetImage("assets/Images/Rangwardhan_Logo.png"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "LOGIN HERE",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: "email",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onChanged: (value) => setState(() {
                _email = value;
              }),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: "password",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onChanged: (value) => setState(() {
                _password = value;
              }),
            ),
            SizedBox(
              height: 150,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 80),
                    backgroundColor: Color.fromARGB(255, 97, 49, 218),
                    textStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30))),
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _email, password: _password)
                      .then((user) => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminHome())))
                      .catchError((e) {});
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 19.0, color: Colors.white),
                )),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Timer(Duration(seconds: 0), () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => AdminHome()));
                  });
                },
                child: Text('next'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
