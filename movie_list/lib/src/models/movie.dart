import 'package:flutter/rendering.dart';

class MoviesList {
  int _page;
  int _totalPages;
  int _totalResults;
  List<Movie> _movies = [];

  MoviesList._(
    List<Movie> results,
    int page,
    int totalPages,
    int totalResults,
  )   : _movies = results,
        _page = page,
        _totalPages = totalPages,
        _totalResults = totalResults;

  factory MoviesList.fromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data'] ?? [];
    return MoviesList._(
      data.map((e) => Movie.fromJson(e)).toList(),
      json['page'],
      json['total_pages'],
      json['total_results'],
    );
  }

  int get page => _page;
  int get totalPages => _totalPages;
  int get totalResults => _totalResults;
  List<Movie> get movies => _movies;
}

class Movie {
  bool _adult;
  String _backdropPath;
  List<int> _genreIds;
  int _id;
  String _originalLanguage;
  String _originalTitle;
  String _overview;
  double _popularity;
  String _posterPath;
  String _releaseDate;
  String _title;
  bool _video;
  double _voteAverage;
  int _voteCount;

  Movie._(
    bool adult,
    String backdropPath,
    List<int> genreIds,
    int id,
    String originalLanguage,
    String originalTitle,
    String overview,
    double popularity,
    String posterPath,
    String releaseDate,
    String title,
    bool video,
    double voteAverage,
    int voteCount,
  )   : _adult = adult,
        _backdropPath = backdropPath,
        _genreIds = genreIds,
        _id = id,
        _originalLanguage = originalLanguage,
        _originalTitle = originalTitle,
        _overview = overview,
        _popularity = popularity,
        _posterPath = posterPath,
        _releaseDate = releaseDate,
        _title = title,
        _video = video,
        _voteAverage = voteAverage,
        _voteCount = voteCount;

  factory Movie.fromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['genre_ids'] ?? [];
    var list = data.map((e) => int.parse(e)).toList();
    return Movie._(
      json['adult'],
      json['backdrop_path'],
      list,
      json['id'],
      json['original_language'],
      json['original_title'],
      json['overview'],
      json['popularity'],
      json['poster_path'],
      json['release_date'],
      json['title'],
      json['video'],
      json['vote_average'],
      json['vote_count'],
    );
  }

  bool get adult => _adult;
  String get backdropPath => _backdropPath;
  List<int> get genreIds => _genreIds;
  int get id => _id;
  String get originalLanguage => _originalLanguage;
  String get originalTitle => _originalTitle;
  String get overview => _overview;
  double get popularity => _popularity;
  String get posterPath => _posterPath;
  String get releaseDate => _releaseDate;
  String get title => _title;
  bool get video => _video;
  double get voteAverage => _voteAverage;
  int get voteCount => _voteCount;
}
