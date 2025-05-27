import 'package:rick_and_morty/domain/entyties/location.dart';
import 'package:rick_and_morty/infrastructure/api/mapper/location_mapper.dart';
import 'package:rick_and_morty/infrastructure/api/requests/location_api_requests.dart';

class LocationService {

  final LocationApiRequests locationApi = LocationApiRequests();

  Future<Location?> getByUrlAsync(String urlString) async {
    var location = await locationApi.getByUrlAsync(urlString);

    if (location != null){
      return LocationMapper.map(location);
    }

    return null;
  }

}