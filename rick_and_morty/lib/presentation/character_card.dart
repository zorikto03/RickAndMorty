import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entyties/character.dart';

class CharacterCard extends StatelessWidget{

  final Character character;
  final Function() actionFavoriteButton;

  const CharacterCard({
    super.key,
    required this.character, 
    required this.actionFavoriteButton});

  @override
  Widget build(BuildContext context) {
    
    return Card(

      child: SizedBox(
        width: double.infinity,
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
              onPressed: actionFavoriteButton
            ) 
          )
        ),
      ),
    );
  }
}