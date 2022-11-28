import 'package:ditonton_dicoding_flutter/common/enums/list_direction.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/widgets/lists/top_rated_movies_list.dart';
import 'package:flutter/material.dart';

class TopRatedMoviesScreen extends StatelessWidget {
  const TopRatedMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: TopRatedMovieList(
          listDirection: ListDirection.vertical,
        ),
      ),
    );
  }
}
