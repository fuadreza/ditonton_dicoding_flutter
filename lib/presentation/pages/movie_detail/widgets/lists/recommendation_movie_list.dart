import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/movie_detail/blocs/recommendation/movie_recommendation_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/movie_detail/blocs/recommendation/movie_recommendation_state.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/movie_detail/movie_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationMovieList extends StatelessWidget {
  const RecommendationMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieRecommendationBloc, MovieRecommendationState>(
      builder: (context, state) {
        if (state is MovieRecommendationStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieRecommendationStateLoaded) {
          return SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final movie = state.listMovie[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        MovieDetailPage.routeName,
                        arguments: movie.id,
                      );
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              },
              itemCount: state.listMovie.length,
            ),
          );
        } else if (state is MovieRecommendationStateFailed) {
          return Center(
            key: const Key('error_message'),
            child: Text(state.message),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
