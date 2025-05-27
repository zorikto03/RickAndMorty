import 'package:flutter/material.dart';
import 'package:rick_and_morty/application/states/location_state.dart';
import 'package:rick_and_morty/domain/entyties/character.dart';
import 'package:rick_and_morty/domain/entyties/location.dart';

class LocationDataModel extends ChangeNotifier{
  Location? location;
  final LocationState _locationState = LocationState();

  void getByCharacter(Character character){
    _locationState.getByCharacterAsync(character)
      .then((value){
        if (value != null){
          location = value;
          notifyListeners();
        }
      }
    );
  }
}

class LocationDataProvider extends InheritedNotifier<LocationDataModel>{
  
  final LocationDataModel model;
  
  const LocationDataProvider({super.key, required super.child, required this.model}) 
    : super(notifier: model);

  static LocationDataModel? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<LocationDataProvider>()?.model;
  }
}