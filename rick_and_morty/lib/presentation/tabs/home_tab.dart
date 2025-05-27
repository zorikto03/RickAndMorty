import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/character_card.dart';
import 'package:rick_and_morty/presentation/models/characters_data_model.dart';

class HomeTab extends StatelessWidget{
  
  const HomeTab({super.key});

  void _loadMoreData(CharactersDataModel model){
    model.addByIndexes(List.generate(10, (index) => model.allCharacters.length + index + 1));
  }
  
  @override
  Widget build(BuildContext context) {
    var model = CharactersDataProvider.of(context)!;
    var charactersList = model.allCharacters;

    return Scaffold(
      appBar: AppBar(
        title: const Text('All characters'),
        centerTitle: true,
      ),
      body: NotificationListener<ScrollNotification>(

        onNotification: (notification){
          if (notification is ScrollEndNotification && 
            notification.metrics.extentAfter.round() == 0){
            _loadMoreData(model);
          }
          return false;
        },

        child: ListView.builder(
          itemCount: charactersList.length + 1, 
          
          itemBuilder: (context, index)
          {
            if (index < charactersList.length){
              return CharacterCard(
                character: charactersList[index],
                actionFavoriteButton: (){
                  var character = charactersList[index];
                  
                  model.changeFavoriteStatus(character);
                },
              );
            }
            else {
              return const Center(
                child: CircularProgressIndicator(),);
            }
          },
        )
      )
    );
  }
}
