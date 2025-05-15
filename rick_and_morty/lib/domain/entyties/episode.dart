import 'dart:ffi';

class Episode {
  Int id;
  String name;
  String airDate;
  String episode;
  List<String> characters;

  Episode({
    required this.id, 
    required this.name,
    required this.airDate, 
    required this.episode, 
    required this.characters});
}
