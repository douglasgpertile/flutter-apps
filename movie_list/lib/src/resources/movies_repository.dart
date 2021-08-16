import 'package:movie_list/src/models/movie.dart';
import 'package:movie_list/src/resources/movies_api_provider.dart';

class MoviesRepository {
  final provider = MoviesApiProvider();

  Future<MoviesList> fetchAllMovies() => provider.fetchMovieList();
}
