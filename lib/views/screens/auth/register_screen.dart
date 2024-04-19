import 'package:flutter/material.dart';
import 'package:shop_hub_store/controllers/auth_controller.dart';
import 'package:shop_hub_store/views/screens/auth/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  late String email = '';
  late String fullName = '';
  late String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register on ShopHub Store",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Image.asset(
              'assets/images/abc.png',
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (value) {
                email = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Email address must not be empty";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: "Email Address",
                hintText: "Enter Email Address",
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xFF103DE5),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (value) {
                fullName = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Full name must not be empty";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: "Full Name",
                hintText: "Enter Full Name",
                prefixIcon: Icon(
                  Icons.person_2,
                  color: Color(0xFF103DE5),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (value) {
                password = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please password must not be empty";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xFF103DE5),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _authController.createNewUser(email, fullName, password);
                  print("success");
                } else {
                  print('Not valid');
                }
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    color: Color(0xFF103DE5),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 15,
            // ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              child: Text(
                'Already have an account?',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
