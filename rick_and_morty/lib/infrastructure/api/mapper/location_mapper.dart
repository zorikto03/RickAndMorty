import 'package:rick_and_morty/domain/entyties/location.dart';
import 'package:rick_and_morty/infrastructure/api/models/location_dto.dart';

class LocationMapper {
  static Location map(LocationDto dto){
    return Location(
      id: dto.id,
      name: dto.name,
      type: dto.type,
      url: dto.url,
      dimension: dto.dimension);
  }

}