import 'package:dio/dio.dart';

import 'package:a02_cinemapedia/config/constants/enviroment.dart';
import 'package:a02_cinemapedia/domain/datasource/movies_dasource.dart';

import 'package:a02_cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:a02_cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:a02_cinemapedia/domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDbKey,
        'language': 'es-ES',
      },
    ),
  );
  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != "not found image")
        .map(
          (moviedb) => MovieMapper.movieDBToEntity(moviedb),
        )
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    });

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', queryParameters: {
      'page': page,
    });

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated', queryParameters: {
      'page': page,
    });

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming', queryParameters: {
      'page': page,
    });

    return _jsonToMovies(response.data);
  }
}
