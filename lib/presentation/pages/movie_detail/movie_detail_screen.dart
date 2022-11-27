import 'package:ditonton_dicoding_flutter/presentation/pages/movie_detail/blocs/detail/movie_detail_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/movie_detail/blocs/detail/movie_detail_state.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/movie_detail/widgets/contents/detail_movie_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MovieDetailBloc, MovieDetailState>(
        listener: (context, state) {
          if (state is MovieDetailStateLoaded) {
            if (state.message != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${state.message}'),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          if (state is MovieDetailStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MovieDetailStateLoaded) {
            return SafeArea(
              child: DetailMovieContent(
                state.movie,
                state.isAddedToWatchList,
              ),
            );
          } else if (state is MovieDetailStateFailed) {
            return Center(
              key: const Key('error_message'),
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text('Unknown'),
            );
          }
        },
      ),
    );
  }
}
