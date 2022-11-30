import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hello/character.dart';
import 'package:hello/character_details.dart';

class CharacterCard extends StatelessWidget {
  // final int id;
  // final String name;
  // final String image;
  // final String species;
  final Character character;

  const CharacterCard({
    Key? key,
    // required this.id,
    // required this.name,
    // required this.image,
    // required this.species,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: character.id,
        child: Image.network(
          character.image,
          loadingBuilder: (context, child, loadingProgress) {
            return loadingProgress == null
                ? child
                : CircularProgressIndicator();
          },
        ),
      ),
      title: Text(character.name),
      subtitle: Text(character.species),
      trailing: Icon(Icons.chevron_right_rounded),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetails(
              character: character,
            ),
          ),
        );
      },
    );
  }
}
