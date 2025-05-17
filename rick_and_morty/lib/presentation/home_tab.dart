import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/character_card.dart';
import 'package:rick_and_morty/presentation/models/characters_data_model.dart';

class HomeTab extends StatelessWidget{

  HomeTab({super.key, required this.dataModel}){
    dataModel.addByIndexes(List.generate(10, (index) => dataModel.allCharacters.length + index));
  }

  final CharactersDataModel dataModel;

  void _loadMoreData(){
    dataModel.addByIndexes(List.generate(10, (index) => dataModel.allCharacters.length + index));
  }

  @override
  Widget build(BuildContext context) {
    var charactersList = dataModel.allCharacters;

    return Scaffold(
      body: NotificationListener<ScrollNotification>(

        onNotification: (notification){
          if (notification is ScrollEndNotification && 
            notification.metrics.extentAfter == 0){
            _loadMoreData();
          }
          return false;
        },

        child: ListenableBuilder(
          listenable: dataModel, 
          builder: (context, child){
            return ListView.builder(
              itemCount: charactersList.length + 1, 
              
              itemBuilder: (context, index)
              {
                if (index < charactersList.length){
                  return CharacterCard(
                    character: charactersList[index],
                    dataModel: dataModel);
                }
                else {
                  return const Center(
                    child: CircularProgressIndicator(),);
                }
              },
            );
          })
        // child: CharacterDataProvider(
        //   model: dataModel,
        //   child: ListView.builder(
        //       itemCount: charactersList.length + 1, 
              
        //       itemBuilder: (context, index)
        //       {
        //         if (index < charactersList.length){
        //           return CharacterCard(character: charactersList[index]);
        //         }
        //         else {
        //           return const Center(
        //             child: CircularProgressIndicator(),);
        //         }
        //       },
        //     )
        // ) 
      )
    );
  }
}
