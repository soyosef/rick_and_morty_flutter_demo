import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hello/character.dart';
import 'package:hello/character_card.dart';
import 'package:hello/character_details.dart';
import 'package:hello/character_network_service.dart';
import 'package:hello/character_screen_by_id.dart';
import 'package:hello/home_screen.dart';
import 'package:hello/listCharacters.dart';
import 'package:hello/loading.dart';
import 'package:hello/profile_screen.dart';
import 'package:hello/settings_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty Characters',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Routing(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Routing extends StatefulWidget {
  const Routing({Key? key}) : super(key: key);

  @override
  State<Routing> createState() => _RoutingState();
}

class _RoutingState extends State<Routing> {
  int _selectedIndex = 0;

  static final List<String> _titles = <String>[
    'Characters',
    'Settings',
  ];

  static final List<Widget> _screens = [
    const ListCharacters(),
    const Center(
      child: Text(
        'SETTINGS',
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
