import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entyties/character.dart';
import 'package:rick_and_morty/presentation/character_info.dart';

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
          
          onTap: () async {
            if (kDebugMode) {
              print('on tap id: ${character.id}');
            }
            
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => CharacterInfo(character: character) )
            );
          },
        
          child: ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(character.image),
            ),
        
            title: Text(
              character.name,
              style: const TextStyle(
                fontSize: 19,
              ),
            ),
        
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                character.gender,
                style: const TextStyle(
                  fontSize: 15
                )
              ),
            ),
        
            trailing: IconButton(
              icon: character.isFavorite ? const Icon(Icons.star) : const Icon(Icons.star_border),
              onPressed: actionFavoriteButton
            ) 
          )
        ),
      ),
    );
  }
}