import 'package:a02_cinemapedia/domain/entities/movie.dart';
import 'package:a02_cinemapedia/domain/repository/movie_repositori.dart';
import 'package:a02_cinemapedia/infrastructure/datasources/moviedb_datasource.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviedbDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
