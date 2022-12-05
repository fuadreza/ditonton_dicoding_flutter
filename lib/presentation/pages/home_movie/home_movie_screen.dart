import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/widgets/labels/sub_heading.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/widgets/lists/now_playing_movies_list.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/widgets/lists/popular_movies_list.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/widgets/lists/top_rated_movies_list.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/now_playing_movie/now_playing_movies_page.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/popular_movie/popular_movies_page.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/top_rated_movies/top_rated_movies_page.dart';
import 'package:flutter/material.dart';

class HomeMovieScreen extends StatelessWidget {
  const HomeMovieScreen({Key? key}) : super(key: key);

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
                Navigator.pushNamed(context, NowPlayingMoviesPage.routeName);
              },
            ),
            const NowPlayingMovieList(),
            SubHeading(
              title: 'Popular',
              onTap: () {
                Navigator.pushNamed(context, PopularMoviesPage.routeName);
              },
            ),
            const PopularMovieList(),
            SubHeading(
              title: 'Top Rated',
              onTap: () {
                Navigator.pushNamed(context, TopRatedMoviesPage.routeName);
              },
            ),
            const TopRatedMovieList(),
          ],
        ),
      ),
    );
  }
}
