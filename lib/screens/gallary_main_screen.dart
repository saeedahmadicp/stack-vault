import 'package:flutter/material.dart';
import 'package:stack_vault/constants.dart';
import 'package:stack_vault/screens/decrypt_screen.dart';
import 'encrypt_screen.dart';

class GalleryMainScreen extends StatefulWidget {
  @override
  _GalleryMainScreenState createState() => _GalleryMainScreenState();
}

class _GalleryMainScreenState extends State<GalleryMainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: kAppBarWithTabBar,
        body: TabBarView(
          children: [
            Text(
              'Main Gallery Images',
            ),
            EcryptScreen(),
            DecryptScreen(),
          ],
        ),
      ),
    );
  }
}
