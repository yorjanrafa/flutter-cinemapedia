import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String theMovieDbKey =
      dotenv.env['THE_MOVIE_DB_API_KEY'] ?? 'The movieDB key not found';
}
