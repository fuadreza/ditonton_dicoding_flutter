import 'package:ditonton_dicoding_flutter/presentation/pages/home/blocs/popular/popular_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/blocs/popular/popular_movie_state.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/widgets/lists/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMovieList extends StatelessWidget {
  const PopularMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieBloc, PopularMovieState>(
      builder: (context, state) {
        if (state is PopularMovieStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PopularMovieStateLoaded) {
          return MovieList(state.listMovie);
        } else {
          return const Text('Failed');
        }
      },
    );
  }
}
