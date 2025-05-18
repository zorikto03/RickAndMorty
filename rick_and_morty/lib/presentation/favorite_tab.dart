import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entyties/character.dart';
import 'package:rick_and_morty/presentation/character_card.dart';
import 'package:rick_and_morty/presentation/models/characters_data_model.dart';

class FavoriteTab extends StatefulWidget{
  const FavoriteTab({super.key, required this.dataModel});

  final CharactersDataModel dataModel;

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  final _listKey = GlobalKey<AnimatedListState>();

  void removeItem(int index, Character character, Animation<double> animation){
    
  }

  @override
  Widget build(BuildContext context) {
    
    var favoriteList = widget.dataModel.favoriteCharacters;

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                widget.dataModel.sortFavoriteListByName();
              });
            }, 
            icon: Icon(Icons.sort_by_alpha)
          ),
          IconButton(
            onPressed: (){
              setState(() {
                widget.dataModel.sortFavoriteListRandom();
              });
            },
            icon: Icon(Icons.shuffle))
        ],
      ),
      body: SafeArea(
        child: AnimatedList(
          key: _listKey,
          initialItemCount: favoriteList.length,
          itemBuilder: (context, index, animation){
            return CharacterCard(
              character: favoriteList[index], 
              dataModel: widget.dataModel,
              actionFavoriteButton: (){
                var character = widget.dataModel.favoriteCharacters[index];
                widget.dataModel.changeFavoriteStatus(character);

                _listKey.currentState?.removeItem(index, (context, animation){
                  return SizeTransition(
                    sizeFactor: animation,//.drive(Tween<Offset>(
                    //   begin: Offset(1.0, 0.0),
                    //   end: Offset(0.0, 0.0)
                    // )),
                    child: CharacterCard(
                      character: character, 
                      dataModel: widget.dataModel,
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

// class FavoriteTab extends StatelessWidget{
//   const FavoriteTab({super.key, required this.dataModel});

//   final CharactersDataModel dataModel;

//   @override
//   Widget build(BuildContext context) {
    
//     var favoriteList = dataModel.favoriteCharacters;

//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: (){
//               dataModel.sortFavoriteListByName();
//             }, 
//             icon: Icon(Icons.sort_by_alpha)
//           ),
//           IconButton(
//             onPressed: (){
//               dataModel.sortFavoriteListRandom();
//             },
//             icon: Icon(Icons.shuffle))
//         ],
//       ),
//       body: ListenableBuilder(
//         listenable: dataModel, 
//         builder: (context, child){
          
//           if (favoriteList.isEmpty){
//             return Center(
//               child: Text("Empty"),
//             );
//           }

//           return ListView.builder(
//             itemCount: favoriteList.length, 
            
//             itemBuilder: (context, index) {
//               return CharacterCard(
//                 character: favoriteList[index], 
//                 dataModel: dataModel);
//             } 
//           );
//         }) 
//     );
//   }
// }