import 'package:flutter/material.dart';
import 'package:online_testing_service/constants.dart';

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
            Text('Normal Photos'),
            Text('Special Photos'),
          ],
        ),
      ),
    );
  }
}
