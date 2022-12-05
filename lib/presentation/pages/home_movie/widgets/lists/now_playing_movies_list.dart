import 'package:ditonton_dicoding_flutter/common/enums/list_direction.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/blocs/now_playing/now_playing_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/blocs/now_playing/now_playing_movie_state.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/widgets/lists/movie_list.dart';
import 'package:ditonton_dicoding_flutter/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingMovieList extends StatelessWidget {
  const NowPlayingMovieList({
    Key? key,
    this.listDirection = ListDirection.horizontal,
  }) : super(key: key);

  final ListDirection listDirection;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMovieBloc, NowPlayingMovieState>(
      builder: (context, state) {
        if (state is NowPlayingMovieStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NowPlayingMovieStateLoaded) {
          if (listDirection == ListDirection.horizontal) {
            return MovieList(state.listMovie);
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                final movie = state.listMovie[index];
                return MovieCard(movie);
              },
              itemCount: state.listMovie.length,
            );
          }
        } else if (state is NowPlayingMovieStateFailed) {
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
