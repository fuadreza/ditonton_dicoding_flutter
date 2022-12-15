import 'package:movie/presentation/pages/watchlist_movies/blocs/watchlist_movies_bloc.dart';
import 'package:movie/presentation/pages/watchlist_movies/blocs/watchlist_movies_state.dart';
import 'package:movie/presentation/pages/watchlist_movies/widgets/cards/movie_watchlist_card_list.dart';
import 'package:movie/presentation/widgets/empty_list.dart';
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
          if (state.listMovie.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return MovieWatchlistCard(state.listMovie[index]);
              },
              itemCount: state.listMovie.length,
            );
          } else {
            return const EmptyList(label: 'Tidak ada watchlist');
          }
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
