import 'package:flutter/material.dart';
import 'package:rick_and_morty/application/states/character_state.dart';
import 'package:rick_and_morty/domain/entyties/character.dart';

class CharactersDataModel extends ChangeNotifier{
  final List<Character> allCharacters = [];
  final List<Character> favoriteCharacters = [];

  var characterState = CharacterState();
  
  // add characters to model
  void addByIndexes(List<int> indexes){
    if (!characterState.isLoading){
      characterState.getRangeAsync(indexes).then(
        (onValue) {
          if (onValue != null){
            allCharacters.addAll(onValue);
            favoriteCharacters.addAll(onValue.where((char) => char.isFavorite));

            notifyListeners();
          }
        }
      );
    }
  }

  void changeFavoriteStatus(Character character){
    bool newValue = !character.isFavorite;
    character.isFavorite = newValue;

    if (newValue){
      favoriteCharacters.add(character);
    }
    else{
      favoriteCharacters.remove(character);
    }

    characterState.updateAsync(character);
    notifyListeners();
  }

  void sortFavoriteListByName(){
    favoriteCharacters.sort((x, y) => x.name.compareTo(y.name));
    notifyListeners();
  }

  void sortFavoriteListRandom(){
    favoriteCharacters.shuffle();
    notifyListeners();
  }
}

class CharactersDataProvider extends InheritedNotifier<CharactersDataModel>{
  final CharactersDataModel model;

  const CharactersDataProvider({super.key, required super.child, required this.model}) 
  : super(notifier: model);

  static CharactersDataModel? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<CharactersDataProvider>()?.model;
  }
}