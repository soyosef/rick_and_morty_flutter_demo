import 'package:flutter/material.dart';

// typedef CharacterList = List<Character>;

class Character {
  int id;
  String name;
  String gender;
  String species;
  String image;
  String url;

  Character({
    required this.id,
    required this.name,
    required this.gender,
    required this.species,
    required this.image,
    required this.url,
  });

  Character.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        gender = json['gender'],
        image = json['image'],
        url = json['url'],
        species = json['species'];
}
