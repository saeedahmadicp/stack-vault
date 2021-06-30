import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stack_vault/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:stack_vault/components/press_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:stack_vault/components/encrypt_decrypt_functions.dart';

String LoggedInUser;

class EcryptScreen extends StatefulWidget {
  @override
  _EcryptScreenState createState() => _EcryptScreenState();
}

class _EcryptScreenState extends State<EcryptScreen> {
  bool isSpining = false;
  var imageFile;

  Future<String> getDestinationPath() async {
    Directory dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  void _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  void _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Widget _setImageView() {
    if (imageFile != null) {
      return Image.file(imageFile, width: 200, height: 200);
    } else {
      return Text("Please select an image");
    }
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Center(
                child: Text("From where do you want to take the photo?"),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

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
                    Center(child: _setImageView()),
                    SizedBox(
                      height: 20.0,
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
                        onPressed: () {
                          _showSelectionDialog(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    PressButton(
                      buttonTitle: 'Encrypt Data',
                      onPressed: () async {
                        String path = await getDestinationPath();
                        EncryptFile(
                            password: "Saeed",
                            srcFilepath: imageFile,
                            distFilepath: '${path}/encrypt/');
                        print(imageFile);
                      },
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
