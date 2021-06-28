import 'package:flutter/material.dart';
import 'loginScreen.dart';
import 'package:online_testing_service/constants.dart';
import 'package:online_testing_service/components/press_button.dart';
import 'package:string_validator/string_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;

  final _registrationFormKey = GlobalKey<FormState>();
  String _firstName, _lastName;
  String _email, _password, _password2;
  String _gender;
  String _selectedGender;
  bool isSpinning = false;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _password2Controller = TextEditingController();

  void _clearText() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _password2Controller.clear();
    _selectedGender = null;
  }

  Color colour = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: ModalProgressHUD(
        inAsyncCall: isSpinning,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              Form(
                  key: _registrationFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 100.0,
                      ),
                      TextFormField(
                        controller: _firstNameController,
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.center,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter first Name',
                        ),
                        validator: (input) =>
                            !isAlpha(input) ? 'Enter a valid name' : null,
                        onSaved: (input) => _firstName = input,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: _lastNameController,
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.center,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter last name',
                        ),
                        validator: (input) =>
                            !isAlpha(input) ? 'Enter a valid name' : null,
                        onSaved: (input) => _lastName = input,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Select Gender:',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Radio(
                            activeColor: Colors.cyan,
                            value: 'male',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                                _gender = value;
                              });
                            },
                          ),
                          Text('Male   '),
                          Radio(
                            activeColor: Colors.cyan,
                            value: 'female',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                                _gender = value;
                              });
                            },
                          ),
                          Text('Female'),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
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
                        controller: _passwordController,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter password',
                        ),
                        validator: (input) =>
                            (input.length < 6) ? 'weak password' : null,
                        onSaved: (input) => _password = input,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: _password2Controller,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Confirm password',
                        ),
                        //  validator: (input) => (input != _password)
                        //    ? 'Password Does not Matches'
                        //  : null,
                        //onSaved: (input) => _password2 = input,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      PressButton(
                        buttonTitle: 'Register',
                        onPressed: () async {
                          if (!_registrationFormKey.currentState.validate()) {
                            print(_email);

                            return;
                          }
                          setState(() {
                            isSpinning = true;
                          });
                          _registrationFormKey.currentState.save();
                          try {
                            final user =
                                await _auth.createUserWithEmailAndPassword(
                                    email: _email.trim(), password: _password);
                            if (user != null) {
                              await _firestore
                                  .collection('usersData')
                                  .document('$_email')
                                  .setData({
                                'firstName': _firstName,
                                'lastName': _lastName,
                                'gender': _gender,
                              });
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                  (route) => false);
                            }
                          } catch (e) {
                            Alert(
                              context: context,
                              title: "Register",
                              desc:
                                  "Registration failed!\nEmail Already in use.",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "OKAY",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  width: 120,
                                  color: Colors.cyanAccent,
                                )
                              ],
                            ).show();
                          }
                          setState(() {
                            isSpinning = false;
                          });
                          _clearText();
                        },
                      )
                    ],
                  )),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Already have account? ',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        colour = Colors.deepOrange;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Log In',
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
    );
  }
}
