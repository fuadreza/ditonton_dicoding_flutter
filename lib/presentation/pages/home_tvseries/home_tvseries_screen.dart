import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/widgets/labels/sub_heading.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/widgets/lists/now_playing_tvseries_list.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/widgets/lists/popular_tvseries_list.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/widgets/lists/top_rated_tvseries_list.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/now_playing_tvseries/now_playing_tvseries_page.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/popular_tvseries/popular_tvseries_page.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/top_rated_tvseries/top_rated_tvseries_page.dart';
import 'package:flutter/material.dart';

class HomeTvSeriesScreen extends StatelessWidget {
  const HomeTvSeriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeading(
              title: 'Now Playing',
              onTap: () {
                Navigator.pushNamed(context, NowPlayingTvSeriesPage.routeName);
              },
            ),
            const NowPlayingTvSeriesList(),
            SubHeading(
              title: 'Popular',
              onTap: () {
                Navigator.pushNamed(context, PopularTvSeriesPage.routeName);
              },
            ),
            const PopularTvSeriesList(),
            SubHeading(
              title: 'Top Rated',
              onTap: () {
                Navigator.pushNamed(context, TopRatedTvSeriesPage.routeName);
              },
            ),
            const TopRatedTvSeriesList(),
          ],
        ),
      ),
    );
  }
}
