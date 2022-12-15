import 'package:core/enums/list_direction.dart';
import 'package:movie/presentation/pages/home_movie/widgets/lists/popular_movies_list.dart';
import 'package:flutter/material.dart';

class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: PopularMovieList(
          listDirection: ListDirection.vertical,
        ),
      ),
    );
  }
}
