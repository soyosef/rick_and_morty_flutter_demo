// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hello/character.dart';

class CharacterById extends StatelessWidget {
  final int id;
  const CharacterById({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CharacterById $id'),
      ),
      body: Container(
          // color: Colors.lightBlue,
          ),
    );
  }
}
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(character.name),
//       ),
//       body: Hero(
//         tag: character.id,
//         child: Image.network(character.image),
//       ),
//     );
//   }
// }
