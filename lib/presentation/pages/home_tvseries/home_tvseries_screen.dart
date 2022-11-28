import 'package:ditonton_dicoding_flutter/common/constants.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/widgets/labels/sub_heading.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/widgets/lists/now_playing_tvseries_list.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/widgets/lists/popular_tvseries_list.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/widgets/lists/top_rated_tvseries_list.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/popular_movie/popular_movies_page.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/top_rated_movies/top_rated_movies_page.dart';
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
            Text(
              'Now Playing',
              style: kHeading6,
            ),
            const NowPlayingTvSeriesList(),
            SubHeading(
              title: 'Popular',
              onTap: () {
                Navigator.pushNamed(context, PopularMoviesPage.routeName);
              },
            ),
            const PopularTvSeriesList(),
            SubHeading(
              title: 'Top Rated',
              onTap: () {
                Navigator.pushNamed(context, TopRatedMoviesPage.routeName);
              },
            ),
            const TopRatedTvSeriesList(),
          ],
        ),
      ),
    );
  }
}
