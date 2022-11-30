import 'dart:convert';

import 'package:hello/character.dart';
import 'package:http/http.dart' as http;

class CharacterNetworkService {
  int page = 1;
  Future<List<Character>> fetchCharacters(pageIndex) async {
    http.Response response = await http.get(Uri.parse(
        'https://rickandmortyapi.com/api/character/?page=$pageIndex'));

    if (response.statusCode == 200) {
      Map characterData = jsonDecode(response.body);
      List<dynamic> characters = characterData['results'];
      return characters.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception("Something went wrong, ${response.statusCode}");
    }
  }

  Future<List<Character>> fetchCharacterDetails(character) async {
    http.Response response = await http
        .get(Uri.parse('https://rickandmortyapi.com/api/character/$character'));

    if (response.statusCode == 200) {
      Map characterData = jsonDecode(response.body);
      List<dynamic> characters = characterData['results'];
      return characters.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception("Something went wrong, ${response.statusCode}");
    }
  }
}
