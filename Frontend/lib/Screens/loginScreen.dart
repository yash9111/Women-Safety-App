import 'package:flutter/material.dart';
import 'package:women_safety_app/Screens/homeScreen.dart';
import 'package:women_safety_app/Screens/regristrationScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Api/LoginUser.dart';
import '../Widgets/bottom_navigation.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: LoginForm(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegistrationPage()),
          );
        },
        child: Icon(Icons.person_add),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController username_controller = TextEditingController();
    TextEditingController password_controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Mobile No."),
            controller: username_controller,
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(labelText: "Password"),
            controller: password_controller,
            obscureText: true,
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () async {
              String mobile = username_controller.text;
              String password = password_controller.text;
              if (await loginUser(mobile, password)) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigation()));
              } else {
                Fluttertoast.showToast(
                  msg: "Something went wrong",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
