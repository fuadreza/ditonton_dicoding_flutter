import 'package:movie/injection.dart';
import 'package:movie/presentation/pages/home_movie/blocs/top_rated/top_rated_movie_bloc.dart';
import 'package:movie/presentation/pages/top_rated_movies/top_rated_movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMoviesPage extends StatelessWidget {
  const TopRatedMoviesPage({Key? key}) : super(key: key);

  static const String routeName = '/top-rated-movie';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<TopRatedMovieBloc>()..getTopRated(),
        ),
      ],
      child: const TopRatedMoviesScreen(),
    );
  }
}
