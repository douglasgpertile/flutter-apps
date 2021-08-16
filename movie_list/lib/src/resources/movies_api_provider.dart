import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_list/src/models/movie.dart';

class MoviesApiProvider {
  Client client = Client();
  static const _baseUrl = 'api.themoviedb.org';
  static const _apiKey = '9031ac4b657084a75be1741103e97ca7';

  Future<MoviesList> fetchMovieList() async {
    final resource = '/movie/popular';
    final response = await client.get(_url(resource));

    if (response.statusCode == 200)
      return MoviesList.fromJson(json.decode(response.body));
    else
      throw Exception('Failed to load post');
  }

  Uri _url(String resource) =>
      Uri.https(_baseUrl, resource, {'api_key': _apiKey});
}
