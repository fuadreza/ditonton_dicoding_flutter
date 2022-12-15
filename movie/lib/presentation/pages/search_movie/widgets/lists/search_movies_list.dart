import 'package:movie/presentation/pages/search_movie/blocs/search_movie_bloc.dart';
import 'package:movie/presentation/pages/search_movie/blocs/search_movie_state.dart';
import 'package:movie/presentation/widgets/empty_list.dart';
import 'package:movie/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchMoviesList extends StatelessWidget {
  const SearchMoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      builder: (context, state) {
        if (state is SearchMovieStateInit) {
          return const Expanded(
            child: Center(
              child: Text('Search movies by title'),
            ),
          );
        } else if (state is SearchMovieStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchMovieStateLoaded) {
          if (state.listMovie.isNotEmpty) {
            return Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final movie = state.listMovie[index];
                  return MovieCard(movie);
                },
                itemCount: state.listMovie.length,
              ),
            );
          } else {
            return const EmptyList(label: 'Tidak ditemukan');
          }
        } else if (state is SearchMovieStateFailed) {
          return Expanded(
            child: Center(
              key: const Key('error_message'),
              child: Text(state.message),
            ),
          );
        } else {
          return const Expanded(
            child: Center(
              child: SizedBox(),
            ),
          );
        }
      },
    );
  }
}
