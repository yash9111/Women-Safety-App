// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:women_safety_app/Screens/otpScreen.dart';

import '../Api/RegisterUser.dart';

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
    TextEditingController name_controller = TextEditingController();
    TextEditingController mobile_controller = TextEditingController();
    TextEditingController pass_controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Full Name"),
            controller: name_controller,
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(labelText: "Mobile No."),
            controller: mobile_controller,
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
            controller: pass_controller,
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              String name = name_controller.text;
              String mobileNo = (mobile_controller.text);
              String password = pass_controller.text;
              // String otp=toString(postData(name, password, mobileNo));
              String otp="2290";
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreen(otp:otp)));
            },
            child: Text("Send OTP"),
          ),
        ],
      ),
    );
  }
}
