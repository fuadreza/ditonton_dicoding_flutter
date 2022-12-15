import 'package:cached_network_image/cached_network_image.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/blocs/recommendation/tvseries_recommendation_bloc.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/blocs/recommendation/tvseries_recommendation_state.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/tvseries_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationTvSeriesList extends StatelessWidget {
  const RecommendationTvSeriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvSeriesRecommendationBloc, TvSeriesRecommendationState>(
      builder: (context, state) {
        if (state is TvSeriesRecommendationStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TvSeriesRecommendationStateLoaded) {
          return SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final movie = state.listTvSeries[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        TvSeriesDetailPage.routeName,
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
              itemCount: state.listTvSeries.length,
            ),
          );
        } else if (state is TvSeriesRecommendationStateFailed) {
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
