import 'package:a02_cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:a02_cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
