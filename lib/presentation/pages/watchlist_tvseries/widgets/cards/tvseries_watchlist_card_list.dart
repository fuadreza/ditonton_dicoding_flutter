import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton_dicoding_flutter/common/constants.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/tvseries.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/tvseries_detail_page.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/watchlist_tvseries/blocs/watchlist_tvseries_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvSeriesWatchlistCard extends StatelessWidget {
  final TvSeries tvSeries;

  const TvSeriesWatchlistCard(this.tvSeries, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            TvSeriesDetailPage.routeName,
            arguments: tvSeries.id,
          ).then((value) {
            context.read<WatchListTvSeriesBloc>().getWatchlist();
          });
        },
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Card(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                  left: 16 + 80 + 16,
                  bottom: 8,
                  right: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tvSeries.originalName ?? '-',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kHeading6,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      tvSeries.overview ?? '-',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 16,
                bottom: 16,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${tvSeries.posterPath}',
                  width: 80,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}