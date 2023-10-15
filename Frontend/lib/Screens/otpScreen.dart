import 'package:flutter/material.dart';

import '../Widgets/bottom_navigation.dart';

class OTPScreen extends StatefulWidget {
  final String otp;
  OTPScreen({required this.otp});
  @override
  _OTPScreenState createState() => _OTPScreenState(otp: otp);
}

class _OTPScreenState extends State<OTPScreen> {
  final String otp;
  _OTPScreenState({required this.otp});
  final TextEditingController otpController = TextEditingController();

  void _verifyOTP() {
    if (otp == otpController.text) print("Otp Verified");
    //Tell Backend that the user is verified and now save the data , into database;

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BottomNavigation()));
    // You can replace this with your own logic to verify the OTP.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter OTP',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'OTP',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _verifyOTP,
                child: Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }
}
