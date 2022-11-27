import 'package:ditonton_dicoding_flutter/presentation/pages/watchlist_movies/blocs/watchlist_movies_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/watchlist_movies/blocs/watchlist_movies_state.dart';
import 'package:ditonton_dicoding_flutter/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListMoviesList extends StatelessWidget {
  const WatchListMoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListMoviesBloc, WatchListMoviesState>(
      builder: (context, state) {
        if (state is WatchListMoviesStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WatchListMoviesStateLoaded) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final movie = state.listMovie[index];
              return MovieCard(movie);
            },
            itemCount: state.listMovie.length,
          );
        } else if (state is WatchListMoviesStateFailed) {
          return Center(
            key: const Key('error_message'),
            child: Text(state.message),
          );
        } else {
          return const Center(child: Text('Failed'));
        }
      },
    );
  }
}
