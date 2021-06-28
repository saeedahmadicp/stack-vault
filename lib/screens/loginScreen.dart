import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SignupScreen.dart';
import 'package:online_testing_service/constants.dart';
import 'package:online_testing_service/components/press_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'gallary_main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String LoggedInUser;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;

  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  bool isSpining = false;

  void _clearFields() {
    emailTextController.clear();
    passwordTextController.clear();
  }

  //text color
  Color colour = Colors.blue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: isSpining,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: emailTextController,
                        textAlign: TextAlign.center,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter email address',
                        ),
                        validator: (input) => !EmailValidator.validate(input)
                            ? 'Enter a valid email'
                            : null,
                        onSaved: (input) => _email = input,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        obscureText: true,
                        controller: passwordTextController,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter password',
                        ),
                        validator: (input) => (input.length < 6)
                            ? 'Password must contain at least 6 characters'
                            : null,
                        onSaved: (input) => _password = input,
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      PressButton(
                        buttonTitle: 'Log In',
                        onPressed: () async {
                          if (!_formKey.currentState.validate()) {
                            _clearFields();
                            return;
                          }
                          setState(() {
                            isSpining = true;
                          });
                          _formKey.currentState.save();
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: _email.trim(), password: _password);
                            if (user != null) {
                              LoggedInUser = _email;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GalleryMainScreen()));
                            }
                          } catch (e) {
                            Alert(
                              context: context,
                              title: "Log In",
                              desc:
                                  "Either the Email or Password is Incorrect!",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "OKAY",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  width: 120,
                                  color: Colors.cyan,
                                )
                              ],
                            ).show();
                          }
                          setState(() {
                            isSpining = false;
                          });

                          _clearFields();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have account? ',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          colour = Colors.cyanAccent;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationScreen()),
                        );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: colour,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
