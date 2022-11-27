import 'package:ditonton_dicoding_flutter/common/enums/list_direction.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/blocs/popular/popular_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/blocs/popular/popular_movie_state.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/widgets/lists/movie_list.dart';
import 'package:ditonton_dicoding_flutter/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMovieList extends StatelessWidget {
  const PopularMovieList({Key? key, this.listDirection = ListDirection.horizontal}) : super(key: key);

  final ListDirection listDirection;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieBloc, PopularMovieState>(
      builder: (context, state) {
        if (state is PopularMovieStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PopularMovieStateLoaded) {
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
        } else if (state is PopularMovieStateFailed) {
          return Center(
            key: const Key('error_message'),
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text('Unknown Error'),
          );
        }
      },
    );
  }
}
