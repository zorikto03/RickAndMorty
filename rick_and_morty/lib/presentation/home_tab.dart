import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/application/states/character_state.dart';
import 'package:rick_and_morty/domain/entyties/character.dart';


class DataModel extends ChangeNotifier{
  final List<Character> data = [];

  var characterState = CharacterState();
  
  void setData(List<int> indexes){
    if (!characterState.isLoading){
      characterState.getRangeAsync(indexes).then(
        (onValue) {
          if (onValue != null){
            data.addAll(onValue);
            notifyListeners();
          }
        }
      );
    }
  }
}

class HomeTab extends StatefulWidget{
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  final DataModel _dataModel = DataModel();

  _HomeTabState(){
    _dataModel.setData(List.generate(20, (index) => index));
  }

  void _loadMoreData(){
    _dataModel.setData(List.generate(10, (index) => _dataModel.data.length + index));
  }

  @override
  Widget build(BuildContext context) {
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
          listenable: _dataModel, 
          builder: (BuildContext context, Widget? child){
            return ListView.builder(
              itemCount: _dataModel.data.length + 1, 
              
              itemBuilder: (context, index)
              {
                if (index < _dataModel.data.length){
                  return CharacterCard(character: _dataModel.data[index]);
                }
                else {
                  return const Center(
                    child: CircularProgressIndicator(),);
                }
              },
            );
          }
        )
      )
    );
  }

}

class CharacterCard extends StatelessWidget{
  
  final Character character;

  const CharacterCard({super.key, required this.character});

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
            icon: character.getIconByStatus(),
            onPressed: (){
              character.setFavoriteStatus();
              final status = character.isFavorite;
              print("ontap trailing $status");
            },
          ) 
        )
      ),
    );
  }
}
