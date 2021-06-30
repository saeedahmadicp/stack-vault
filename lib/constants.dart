import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.cyanAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.cyanAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

final kAppBar = AppBar(
  backgroundColor: Colors.cyan,
  title: Center(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/images/stackvault.png'),
          height: 40,
          width: 40,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Stack Vault',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
);

Widget buildAppBar({Function onPressed, String appBarTitle}) {
  return AppBar(
    backgroundColor: Colors.cyan[600],
    leading: GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          Text(
            'back',
          )
        ],
      ),
    ),
    title: Center(
      child: Text(
        appBarTitle,
      ),
    ),
  );
}

final kAppBarWithTabBar = AppBar(
  backgroundColor: Colors.cyan,
  title: Center(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/images/stackvault.png'),
          height: 40,
          width: 40,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Stack Vault',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
  bottom: TabBar(
    //labelColor: Colors.cyan[100],
    indicatorColor: Colors.cyan[900],
    unselectedLabelColor: Colors.blueGrey[100],
    tabs: [
      Tab(
        text: 'Main Screen',
        //icon: Icon(Icons.image),
      ),
      Tab(
        text: 'Encrypt',
        //icon: Icon(Icons.image),
      ),
      Tab(
        text: 'Decrypt',
        //icon: Icon(Icons.image),
      ),
    ],
  ),
);
