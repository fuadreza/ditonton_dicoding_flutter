import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton_dicoding_flutter/common/constants.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/season.dart';
import 'package:ditonton_dicoding_flutter/injection.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/blocs/season/tvseries_detail_season_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/blocs/season/tvseries_detail_season_state.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/widgets/contents/detail_season_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

showSeasonDialog(BuildContext context, Season season, int tvId) {
  showDialog(
    context: context,
    builder: (ctx) {
      return Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: SizedBox(
          width: 400,
          height: 400,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              season.posterPath != null
                  ? ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      child: CachedNetworkImage(
                        width: 150,
                        height: 400,
                        fit: BoxFit.cover,
                        imageUrl: '$baseImageUrl${season.posterPath}',
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    )
                  : const SizedBox(),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10).copyWith(bottom: 4),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          season.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        BlocProvider(
                          create: (_) => locator<TvSeriesDetailSeasonBloc>()..getSeasons(tvId, season.seasonNumber),
                          child: BlocBuilder<TvSeriesDetailSeasonBloc, TvSeriesDetailSeasonState>(
                            builder: (ctx, state) {
                              if (state is TvSeriesDetailSeasonStateLoaded) {
                                return DetailSeasonContent(seasonDetail: state.seasonDetail);
                              } else {
                                return const Text('EMPTY');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
