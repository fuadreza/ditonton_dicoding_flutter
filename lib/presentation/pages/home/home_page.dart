import 'package:ditonton_dicoding_flutter/presentation/pages/about/about_page.dart';
import 'package:flutter/material.dart';
import 'package:movie/presentation/pages/home_movie/home_movie_page.dart';
import 'package:movie/presentation/pages/search_movie/search_movie_page.dart';
import 'package:movie/presentation/pages/watchlist_movies/watchlist_movies_page.dart';
import 'package:tvseries/presentation/pages/home_tvseries/home_tvseries_page.dart';
import 'package:tvseries/presentation/pages/search_tvseries/search_tvseries_page.dart';
import 'package:tvseries/presentation/pages/watchlist_tvseries/watchlist_tvseries_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeMoviePage(),
    const HomeTvSeriesPage(),
  ];

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
              selected: _selectedIndex == 0,
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.tv),
              title: const Text('Tv Series'),
              selected: _selectedIndex == 1,
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist Movies'),
              onTap: () {
                Navigator.pushNamed(context, WatchListMoviesPage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist Tv Series'),
              onTap: () {
                Navigator.pushNamed(context, WatchListTvSeriesPage.routeName);
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
              if (_selectedIndex == 0) {
                Navigator.pushNamed(context, SearchMoviePage.routeName);
              } else if (_selectedIndex == 1) {
                Navigator.pushNamed(context, SearchTvSeriesPage.routeName);
              }
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}
