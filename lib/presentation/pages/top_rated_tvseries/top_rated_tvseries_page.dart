import 'package:ditonton_dicoding_flutter/injection.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/top_rated/top_rated_tvseries_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/top_rated_tvseries/top_rated_tvseries_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedTvSeriesPage extends StatelessWidget {
  const TopRatedTvSeriesPage({Key? key}) : super(key: key);

  static const routeName = '/top-rated-tvseries';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<TopRatedTvSeriesBloc>()..getTopRated(),
        ),
      ],
      child: const TopRatedTvSeriesScreen(),
    );
  }
}
