import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hello/character.dart';
import 'package:hello/character_card.dart';
import 'package:hello/character_network_service.dart';
import 'package:hello/loading.dart';

class ListCharacters extends StatefulWidget {
  const ListCharacters({Key? key}) : super(key: key);

  @override
  State<ListCharacters> createState() => _ListCharactersState();
}

class _ListCharactersState extends State<ListCharacters> {
  final CharacterNetworkService characterService = CharacterNetworkService();
  final ScrollController _scrollController = ScrollController();

  List<Character> _characters = [];
  int _pageIndex = 1;
  bool _isLoading = true;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent * 0.65 &&
          !_isLoading &&
          _hasMore) {
        _fetchData();
      }
    });
  }

  _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    await characterService.fetchCharacters(_pageIndex).then((value) {
      _characters.addAll(value);
    });

    setState(() {
      _isLoading = false;
      _pageIndex++;
      _hasMore = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        cacheExtent: 1300,
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            title: Text(
              'Characters',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SliverSafeArea(
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, int i) {
                  if (_characters.isNotEmpty) {
                    return CharacterCard(
                      character: _characters[i],
                    );
                  }
                  if (_isLoading) {
                    return Loading();
                  }
                  return Loading();
                },
                childCount: _characters.length,
              ),
            ),
          )
        ],
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder(
  //     future: characterService.fetchCharacters(_pageIndex),
  //     builder:
  //         ((BuildContext context, AsyncSnapshot<List<Character>> snapshot) {
  //       if (snapshot.hasData) {
  //         return CustomScrollView(
  //           controller: _scrollController,
  //           slivers: [
  //             SliverAppBar(
  //               title: Text('Characters'),
  //             ),
  //             SliverList(
  //               delegate: SliverChildBuilderDelegate(
  //                 (context, int index) {
  //                   var currentCharacter = snapshot.data![index];
  //                   return CharacterCard(
  //                     character: currentCharacter,
  //                   );
  //                 },
  //               ),
  //             )
  //           ],
  //         );
  //       }
  //       if (snapshot.hasError) {
  //         return Text('Error!');
  //       }
  //       return Center(
  //         child: Loading(),
  //       );
  //     }),
  //   );
  // }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
