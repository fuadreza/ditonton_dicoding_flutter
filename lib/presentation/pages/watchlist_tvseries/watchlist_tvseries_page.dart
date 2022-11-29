import 'package:ditonton_dicoding_flutter/injection.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/watchlist_tvseries/blocs/watchlist_tvseries_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/watchlist_tvseries/watchlist_tvseries_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListTvSeriesPage extends StatelessWidget {
  const WatchListTvSeriesPage({Key? key}) : super(key: key);
  static const routeName = '/watchlist-tvseries';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<WatchListTvSeriesBloc>()..getWatchlist())
      ],
      child: const WatchListTvSeriesScreen(),
    );
  }
}
