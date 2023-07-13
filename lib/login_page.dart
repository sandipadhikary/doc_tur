// TODO Implement this library.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneNumberController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _verifyPhoneNumber() async {
    String phoneNumber = "+91" + _phoneNumberController.text.trim();

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Sign in with the auto-generated credential
        await _auth.signInWithCredential(credential);
        // Redirect to the home page
        Navigator.pushNamed(context, '/home');
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
        // Handle verification failed scenario
      },
      codeSent: (String verificationId, int? resendToken) {
        // Save the verification ID and navigate to the OTP screen
        Navigator.pushNamed(context, '/otp', arguments: verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout scenario
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _verifyPhoneNumber,
              child: Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
