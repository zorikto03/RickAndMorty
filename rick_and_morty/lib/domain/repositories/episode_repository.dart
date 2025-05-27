import 'package:rick_and_morty/domain/entyties/episode.dart';

abstract class EpisodeRepository {
  getByIdAsync(int id);

  Future<bool> contains(Episode episode);

  add(Episode episode);

  deleteById(int id);

  update(Episode episode);

}