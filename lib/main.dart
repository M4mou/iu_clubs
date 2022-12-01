// @dart=2.9
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iu_clubs/calendar.dart';
import 'package:iu_clubs/leaderboard.dart';

import 'globals/global_methods.dart';
import 'history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final List<Widget> _children = [
    Calendar(),
    Leaderboard(),
    History(),
  ];

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "IU Clubs",
          style: TextStyle(color: Colors.black,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),

        //Add photo to the top right corner
        actions: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset("assets/images/profile.png", width: 30, height: 30),
          )
        ],
      ),
      body: Center(
        child: widget._children[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_view_week),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),


    );

  }

}


