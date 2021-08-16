import 'package:movie_list/src/models/movie.dart';
import 'package:movie_list/src/resources/movies_repository.dart';
import 'package:rxdart/rxdart.dart';

class _MoviesBloc {
  final _repository = MoviesRepository();
  final _fetcher = PublishSubject<MoviesList>();

  Stream<MoviesList> get allMovies => _fetcher.stream;

  fetchAllMovies() async {
    MoviesList moviesList = await _repository.fetchAllMovies();
    _fetcher.sink.add(moviesList);
  }

  dispose() {
    _fetcher.close();
  }
}

final moviesBloc = _MoviesBloc();
