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

// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Rick and Morty Characters',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       // home: Routing(),
//       // routes: {
//       //   // '/': (context) => Routing(),
//       //   '/': (context) => HomeScreen(),
//       //   '/settings': (context) => SettingsScreen(),
//       //   '/profile': (context) => ProfileScreen(),
//       // },
//       // onGenerateRoute: (RouteSettings settings) {
//       //   print(settings);
//       //   // Handle '/'
//       //   if (settings.name == '/') {
//       //     return MaterialPageRoute(builder: (context) => HomeScreen());
//       //   }

//       //   // Handle '/details/:id'
//       //   var uri = Uri.parse(settings.name.toString());
//       //   if (uri.pathSegments.length == 2 &&
//       //       uri.pathSegments.first == 'character') {
//       //     int id = int.parse(uri.pathSegments[1]);
//       //     return MaterialPageRoute(builder: (context) => CharacterById(id: id));
//       //   }

//       //   // handle unknown screens:
//       //   // return MaterialPageRoute(builder: (context) => UnknownScreen());
//       // },
//       // home: Navigator(
//       //   pages: [
//       //     MaterialPage(child: HomeScreen()),
//       //     if (true) MaterialPage(child: SettingsScreen()),
//       //   ],
//       //   onPopPage: (route, result) => route.didPop(result),
//       // ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty Characters',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // routerDelegate: RouterDelegate(),
      // routeInformationParser: RouteInformationParser(),
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
    // Text('micha'),
    ListCharacters(),
    // ListCharacters(),
    const Text(
      'SETTINGS',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // ScaffoldState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_titles.elementAt(_selectedIndex)),
      // ),
      // drawer: Column(
      //   children: [
      //     Text('data'),
      //     Text('data'),
      //   ],
      // ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      // body: _screens.elementAt(_selectedIndex),
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

// class ListCharacters extends StatelessWidget {
//   final CharacterNetworkService characterService = CharacterNetworkService();

//   ListCharacters({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         color: Colors.white,
//         child: SafeArea(
//           child: FutureBuilder(
//             future: characterService.fetchCharacters(),
//             builder: (BuildContext context,
//                 AsyncSnapshot<List<Character>> snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, int index) {
//                       var currentCharacter = snapshot.data![index];
//                       return CharacterCard(
//                         character: currentCharacter,
//                       );
//                     });
//               }
//               if (snapshot.hasError) {
//                 print(snapshot.error);
//                 return const Center(
//                   child: Text('Error!'),
//                 );
//               }
//               return const Center(
//                 child: Loading(),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }