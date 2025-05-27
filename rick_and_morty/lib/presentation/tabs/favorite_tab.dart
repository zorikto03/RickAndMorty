import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entyties/character.dart';
import 'package:rick_and_morty/presentation/character_card.dart';
import 'package:rick_and_morty/presentation/models/characters_data_model.dart';

class FavoriteTab extends StatefulWidget{
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  final _listKey = GlobalKey<AnimatedListState>();

  void removeItem(int index, Character character, Animation<double> animation){
    
  }

  @override
  Widget build(BuildContext context) {
    var model = CharactersDataProvider.of(context)!;
    var favoriteList = model.favoriteCharacters;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                model.sortFavoriteListByName();
              });
            }, 
            icon: const Icon(Icons.sort_by_alpha)
          ),
          IconButton(
            onPressed: (){
              setState(() {
                model.sortFavoriteListRandom();
              });
            },
            icon: const Icon(Icons.shuffle))
        ],
      ),
      body: SafeArea(
        child: AnimatedList(
          key: _listKey,
          initialItemCount: favoriteList.length,
          itemBuilder: (context, index, animation){
            return CharacterCard(
              character: favoriteList[index], 
              actionFavoriteButton: (){
                var character = model.favoriteCharacters[index];
                model.changeFavoriteStatus(character);

                _listKey.currentState?.removeItem(index, (context, animation){
                  return SizeTransition(
                    sizeFactor: animation,//.drive(Tween<Offset>(
                    //   begin: Offset(1.0, 0.0),
                    //   end: Offset(0.0, 0.0)
                    // )),
                    child: CharacterCard(
                      character: character, 
                      actionFavoriteButton: (){},)
                  ); 
                });
              }
            );
          } ,
        ),
      )
    );
  }
}