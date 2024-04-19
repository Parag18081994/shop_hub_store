import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_hub_store/views/screens/auth/register_screen.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  const LoginScreen({super.key});

  late String email = '';
  late String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login Account",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
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
                    return "Please Email Address must not be empty";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: "Email Address",
                  hintText: 'Enter Email Address',
                  prefixIcon: Icon(
                    Icons.email_sharp,
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
                  hintText: "Enter your Password",
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
                    print("Logged in ");
                    print(email);
                    print(password);
                  } else {
                    print("unable to auntheicate user");
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
                      "Login",
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
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegisterScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  "Need an Account?",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
