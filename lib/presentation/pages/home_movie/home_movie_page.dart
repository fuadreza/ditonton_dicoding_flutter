import 'package:ditonton_dicoding_flutter/injection.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/blocs/now_playing/now_playing_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/blocs/popular/popular_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/blocs/top_rated/top_rated_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/home_movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMoviePage extends StatelessWidget {
  const HomeMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<NowPlayingMovieBloc>()..getNowPlaying(),
        ),
        BlocProvider(
          create: (_) => locator<PopularMovieBloc>()..getPopular(),
        ),
        BlocProvider(
          create: (_) => locator<TopRatedMovieBloc>()..getTopRated(),
        ),
      ],
      child: const HomeMovieScreen(),
    );
  }
}
