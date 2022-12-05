import 'package:ditonton_dicoding_flutter/injection.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/blocs/now_playing/now_playing_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/now_playing_movie/now_playing_movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingMoviesPage extends StatelessWidget {
  const NowPlayingMoviesPage({Key? key}) : super(key: key);

  static const routeName = '/now-playing-movies';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<NowPlayingMovieBloc>()..getNowPlaying(),
        ),
      ],
      child: const NowPlayingMoviesScreen(),
    );
  }
}
