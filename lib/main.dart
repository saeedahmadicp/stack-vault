import 'package:flutter/material.dart';
import 'package:online_testing_service/screens/gallary_main_screen.dart';
import 'screens/loginScreen.dart';

void main() {
  runApp(StackVault());
}

class StackVault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Testing Service',
      theme: ThemeData.light(),
      //home: LoginScreen(),
      home: GalleryMainScreen(),
      routes: <String, WidgetBuilder>{
        'loginScreen': (context) => LoginScreen(),
        'studentScreen': (context) => LoginScreen(),
      },
    );
  }
}
