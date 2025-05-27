import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/infrastructure/api/models/location_dto.dart';

class LocationApiRequests {

  Future<LocationDto?> getByUrlAsync(String urlString) async {
    var uri = Uri.parse(urlString);
    
    try{
      final response = await http.get(uri);

      if (response.statusCode != 200){
        return null;
      }

      Map<String, dynamic> map = jsonDecode(response.body);
      
      var location = LocationDto.fromJson(map);
      
      return location;
    }
    on Exception catch(e){
      print(e);
      return null;
    } 
  }
}