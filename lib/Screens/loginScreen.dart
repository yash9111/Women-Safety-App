import 'package:flutter/material.dart';
import 'package:women_safety_app/Screens/regristrationScreen.dart';

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
            onPressed: () {
              print(username_controller.text.toString());
              print(password_controller.text);
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
