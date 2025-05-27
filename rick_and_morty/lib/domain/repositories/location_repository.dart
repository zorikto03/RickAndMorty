import 'package:rick_and_morty/domain/entyties/location.dart';

abstract class LocationRepository {
  getByName(String name);

  Future<bool> contains(Location location);

  add(Location location);

  deleteById(int id);

  update(Location location);

  Future<List<Location>> getAll();
}