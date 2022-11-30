// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hello/character.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;
  const CharacterDetails({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Container(
        // color: Colors.lightBlue,
        child: Column(
          children: [
            Container(
              // color: Colors.lightBlue,
              child: Hero(
                tag: character.id,
                child: Image.network(
                  character.image,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('id'),
                    subtitle: Text(character.id.toString()),
                  ),
                  ListTile(
                    title: Text('name'),
                    subtitle: Text(character.name),
                  ),
                  ListTile(
                    title: Text('gender'),
                    subtitle: Text(character.gender),
                  ),
                  ListTile(
                    title: Text('species'),
                    subtitle: Text(character.species),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: Image.network(character.image),
            // ),
            // Expanded(
            //   flex: 1,
            //   child: Placeholder(),
            // ),
          ],
        ),
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
