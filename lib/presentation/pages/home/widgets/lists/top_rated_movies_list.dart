import 'package:ditonton_dicoding_flutter/presentation/pages/home/blocs/top_rated/top_rated_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/blocs/top_rated/top_rated_movie_state.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/widgets/lists/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMovieList extends StatelessWidget {
  const TopRatedMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
      builder: (context, state) {
        if (state is TopRatedMovieStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TopRatedMovieStateLoaded) {
          return MovieList(state.listMovie);
        } else if (state is TopRatedMovieStateFailed) {
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
