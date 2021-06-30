import 'package:flutter/material.dart';
import 'package:stack_vault/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:stack_vault/components/press_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

String LoggedInUser;

class DecryptScreen extends StatefulWidget {
  @override
  _DecryptScreenState createState() => _DecryptScreenState();
}

class _DecryptScreenState extends State<DecryptScreen> {
  bool isSpining = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: isSpining,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                        'Select Images',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RaisedButton(
                        elevation: 10,
                        child: Icon(
                          Icons.camera_enhance,
                          color: Colors.cyan,
                          size: 60,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    PressButton(
                      buttonTitle: 'Decrypt Data',
                      // onPressed: () async {
                      //   if (!_formKey.currentState.validate()) {
                      //     _clearFields();
                      //     return;
                      //   }
                      //   setState(() {
                      //     isSpining = true;
                      //   });
                      //   _formKey.currentState.save();
                      //   try {
                      //     final user = await _auth.signInWithEmailAndPassword(
                      //         email: _email.trim(), password: _password);
                      //     if (user != null) {
                      //       LoggedInUser = _email;
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) =>
                      //                   GalleryMainScreen()));
                      //     }
                      //   } catch (e) {
                      //     Alert(
                      //       context: context,
                      //       title: "Log In",
                      //       desc:
                      //       "Either the Email or Password is Incorrect!",
                      //       buttons: [
                      //         DialogButton(
                      //           child: Text(
                      //             "OKAY",
                      //             style: TextStyle(
                      //                 color: Colors.white, fontSize: 20),
                      //           ),
                      //           onPressed: () => Navigator.pop(context),
                      //           width: 120,
                      //           color: Colors.cyan,
                      //         )
                      //       ],
                      //     ).show();
                      //   }
                      //   setState(() {
                      //     isSpining = false;
                      //   });
                      //
                      //   _clearFields();
                      // },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
