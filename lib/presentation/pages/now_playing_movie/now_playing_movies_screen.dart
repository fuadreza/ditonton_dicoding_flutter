import 'package:ditonton_dicoding_flutter/common/enums/list_direction.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/widgets/lists/now_playing_movies_list.dart';
import 'package:flutter/material.dart';

class NowPlayingMoviesScreen extends StatelessWidget {
  const NowPlayingMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing Movies'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: NowPlayingMovieList(
          listDirection: ListDirection.vertical,
        ),
      ),
    );
  }
}
