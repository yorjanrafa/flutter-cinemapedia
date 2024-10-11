import 'package:a02_cinemapedia/domain/entities/movie.dart';

abstract class MoviesDasource {
  Future<List<Movie>> getNowPlaying({
    int page = 1,
  });
}
