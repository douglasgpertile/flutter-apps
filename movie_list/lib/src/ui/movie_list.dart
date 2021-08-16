import 'package:flutter/material.dart';
import 'package:movie_list/src/models/movie.dart';
import '../blocs/movies_bloc.dart';

class MovieList extends StatelessWidget {
  const MovieList();

  @override
  Widget build(BuildContext context) {
    moviesBloc.fetchAllMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: moviesBloc.allMovies,
        builder: (context, AsyncSnapshot<MoviesList> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<MoviesList> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data?.movies.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, int index) {
        return Image.network(
          'https://image.tmdb.org/t/p/w185${snapshot.data?.movies.elementAt(index).posterPath}',
          fit: BoxFit.cover,
        );
      },
    );
  }
}
