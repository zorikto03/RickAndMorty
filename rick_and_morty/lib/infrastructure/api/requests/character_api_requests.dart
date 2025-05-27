import 'dart:convert';
import 'package:rick_and_morty/infrastructure/api/models/character_dto.dart';
import 'package:http/http.dart' as http;

class CharacterApiRequests {
  
  Future<CharacterDto?> getByIdAsync(int id) 
  async 
  {
    final url = Uri.parse('https://rickandmortyapi.com/api/character/$id');
    
    try {
      final response = await http.get(url);

      if(response.statusCode != 200){
        return null;
      }
      
      Map<String, dynamic> json = jsonDecode(response.body);
      var character = CharacterDto.fromJson(json);
      
      return character;
    } 
    on Exception catch(e){
      print('getById request error: ($e)');
      return null;
    } 
  }

  Future<List<CharacterDto>?> getMultipleAsync(List<int> characterIds)
  async
  {
    final url = Uri.parse('https://rickandmortyapi.com/api/character/$characterIds');
    
    try {
      final response = await http.get(url);

      if(response.statusCode != 200){
        return null;
      }

      List<CharacterDto> list = List<CharacterDto>
      .from(
        jsonDecode(response.body)
        .map((item) => CharacterDto.fromJson(item))
      );
      
      return list;
    } 
    on Exception catch(e){
      print('getMultiple request error: ($e)');
      return null;
    } 
  }
}