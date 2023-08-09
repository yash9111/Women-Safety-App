
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration")),
      body: Center(
        child: RegistrationForm(),
      ),
    );
  }
}


class RegistrationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Full Name"),
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(labelText: "Mobile No."),
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
      
            },
            child: Text("Register"),
          ),
        ],
      ),
    );
  }
}
