import 'package:movie/presentation/pages/watchlist_movies/widgets/lists/watchlist_movie_list.dart';
import 'package:flutter/material.dart';

class WatchListMoviesScreen extends StatelessWidget {
  const WatchListMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist Movies'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: WatchListMoviesList(),
      ),
    );
  }
}
