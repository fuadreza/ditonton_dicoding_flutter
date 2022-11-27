import 'package:ditonton_dicoding_flutter/presentation/pages/home/blocs/now_playing/now_playing_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/blocs/now_playing/now_playing_movie_state.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/widgets/lists/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingMovieList extends StatelessWidget {
  const NowPlayingMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMovieBloc, NowPlayingMovieState>(
      builder: (context, state) {
        if (state is NowPlayingMovieStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NowPlayingMovieStateLoaded) {
          return MovieList(state.listMovie);
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
