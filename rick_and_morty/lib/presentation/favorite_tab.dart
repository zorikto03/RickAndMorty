import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/presentation/character_card.dart';
import 'package:rick_and_morty/presentation/models/characters_data_model.dart';

class FavoriteTab extends StatelessWidget{
  const FavoriteTab({super.key, required this.dataModel});

  final CharactersDataModel dataModel;

  @override
  Widget build(BuildContext context) {
    var favoriteList = dataModel.favoriteCharacters;

    return ListView.builder(
      itemCount: favoriteList.length, 
      
      itemBuilder: (context, index) {
        if (favoriteList.isEmpty){
          return const Text("Empty");
        }
        else{
          return CharacterCard(
            character: favoriteList[index], 
            dataModel: dataModel);
        }
      } 
    );
  }
}