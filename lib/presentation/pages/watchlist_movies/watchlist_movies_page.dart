import 'package:ditonton_dicoding_flutter/injection.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/watchlist_movies/blocs/watchlist_movies_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/watchlist_movies/watchlist_movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListMoviesPage extends StatelessWidget {
  const WatchListMoviesPage({Key? key}) : super(key: key);
  static const routeName = '/watchlist-movie';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<WatchListMoviesBloc>()..getWatchlist())
      ],
      child: const WatchListMoviesScreen(),
    );
  }
}
