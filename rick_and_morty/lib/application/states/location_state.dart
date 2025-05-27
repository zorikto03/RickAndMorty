import 'package:rick_and_morty/domain/entyties/character.dart';
import 'package:rick_and_morty/domain/entyties/location.dart';
import 'package:rick_and_morty/domain/repositories/location_repository.dart';
import 'package:rick_and_morty/infrastructure/api/services/location_service.dart';
import 'package:rick_and_morty/infrastructure/persistence/repositories/location_repository_imp.dart';

class LocationState {
  late final LocationService _locationService;
  late final LocationRepository _locationRepository;

  LocationState(){
    _locationRepository = LocationRepositoryImp();
    _locationService = LocationService();
  }

  Future<Location?> getByCharacterAsync(Character character) 
  async {
    var location = await _locationRepository.getByName(character.locationName);
    
    if (location == null){
      location = await _locationService.getByUrlAsync(character.locationUrl);

      if (location != null){
        _locationRepository.add(location);
      }
    }
    
    if (location != null){
      return location;
    }

    return null;
  }
}