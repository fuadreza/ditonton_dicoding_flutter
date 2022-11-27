import 'package:ditonton_dicoding_flutter/common/constants.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/about/about_page.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/widgets/labels/sub_heading.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/widgets/lists/now_playing_movies_list.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/widgets/lists/popular_movies_list.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/widgets/lists/top_rated_movies_list.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/popular_movie/popular_movies_page.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/search/search_page.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/top_rated_movies/top_rated_movies_page.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/watchlist_movies/watchlist_movies_page.dart';
import 'package:flutter/material.dart';

class HomeMovieScreen extends StatelessWidget {
  const HomeMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Movies'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WatchListMoviesPage.routeName);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.routeName);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchMoviePage.routeName);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Now Playing',
                style: kHeading6,
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
      ),
    );
  }
}
