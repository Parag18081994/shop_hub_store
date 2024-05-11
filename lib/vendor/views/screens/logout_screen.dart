import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_hub_store/views/screens/auth/welcome_screens/welcome_register_screen.dart';
// Import your WelcomeRegisterScreen

class LogoutScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            await _auth.signOut();
            // After signing out, navigate to WelcomeRegisterScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WelcomeRegisterScreen()),
            );
          },
          child: SizedBox(
            width: 150,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              child: Center(
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
