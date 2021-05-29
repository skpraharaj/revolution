import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:revolution/screens/home_screen.dart';
import 'package:revolution/screens/login_screen.dart';
import 'package:revolution/services/authentication_service.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isLoading = false;

  AuthenticationService authenticationService = AuthenticationService();

  final formKey = GlobalKey<FormState>();
  TextEditingController _usernameTextEditingController =
      new TextEditingController();
  TextEditingController _emailTextEditingController =
      new TextEditingController();
  TextEditingController _passwordTextEditingController =
      new TextEditingController();

  signMeUp() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      authenticationService.signUp(_emailTextEditingController.text,
          _passwordTextEditingController.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.7),
              Theme.of(context).primaryColor.withOpacity(0.9),
            ],
          ),
        ),
        child: isLoading
            ? Container(
                child: Center(child: CircularProgressIndicator.adaptive()),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  registerTitle(),
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 60,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xFFA5E6F3),
                                          blurRadius: 20,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]),
                                          ),
                                        ),
                                        child: TextFormField(
                                          validator: (value) {
                                            return value.isEmpty ||
                                                    value.length < 4
                                                ? "Enter a username with more than 4 charachters"
                                                : null;
                                          },
                                          controller:
                                              _usernameTextEditingController,
                                          decoration: InputDecoration(
                                              hintText: "Username",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]),
                                          ),
                                        ),
                                        child: TextFormField(
                                          validator: (value) {
                                            return RegExp(
                                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                    .hasMatch(value)
                                                ? null
                                                : "Please provide a valid Email address";
                                          },
                                          controller:
                                              _emailTextEditingController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              hintText: "Email",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]),
                                          ),
                                        ),
                                        child: TextFormField(
                                          validator: (value) {
                                            return value.length > 6
                                                ? null
                                                : "Please provide a password with atleast 6 charachters";
                                          },
                                          controller:
                                              _passwordTextEditingController,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                              hintText: "Password",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              //Register button
                              GestureDetector(
                                onTap: () async {
                                  signMeUp();
                                },
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Theme.of(context).primaryColor),
                                  child: Center(
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: Text(
                                  "Already a member? Login here.",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Padding registerTitle() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Register",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
