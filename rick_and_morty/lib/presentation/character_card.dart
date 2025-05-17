import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entyties/character.dart';
import 'package:rick_and_morty/presentation/models/characters_data_model.dart';

class CharacterCard extends StatelessWidget{
  
  final Character character;
  final CharactersDataModel dataModel;

  const CharacterCard({super.key, required this.character, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    
    return Card(

      child: InkWell(
        
        onTap: (){
          if (kDebugMode) {
            var id = character.id;
            print("on tap id: $id");
          }
        },

        child: ListTile(
          leading: CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(character.image),
          ),

          title: Text(
            character.name,
            style: TextStyle(
              fontSize: 19,
            ),
          ),

          subtitle: Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Text(
              character.gender,
              style: TextStyle(
                fontSize: 15
              )
            ),
          ),

          trailing: IconButton(
            icon: character.isFavorite ? Icon(Icons.star) : Icon(Icons.star_border),
            onPressed: (){
              
              bool newValue = !character.isFavorite;
              character.isFavorite = newValue;

              if (newValue){
                dataModel.addToFavoriteList(character);
              }
              else{
                dataModel.deleteFromFavoriteList(character);
              }
            },
          ) 
        )
      ),
    );
  }
}