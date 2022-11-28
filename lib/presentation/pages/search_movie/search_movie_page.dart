import 'package:ditonton_dicoding_flutter/injection.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/search_movie/blocs/search_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/search_movie/search_movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchMoviePage extends StatelessWidget {
  const SearchMoviePage({Key? key}) : super(key: key);

  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<SearchMovieBloc>(),
        ),
      ],
      child: const SearchMovieScreen(),
    );
  }
}
