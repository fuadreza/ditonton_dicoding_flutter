import 'package:tvseries/injection.dart';
import 'package:tvseries/presentation/pages/home_tvseries/blocs/now_playing/now_playing_tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/home_tvseries/blocs/popular/popular_tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/home_tvseries/blocs/top_rated/top_rated_tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/home_tvseries/home_tvseries_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTvSeriesPage extends StatelessWidget {
  const HomeTvSeriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<NowPlayingTvSeriesBloc>()..getNowPlaying(),
        ),
        BlocProvider(
          create: (_) => locator<PopularTvSeriesBloc>()..getPopular(),
        ),
        BlocProvider(
          create: (_) => locator<TopRatedTvSeriesBloc>()..getTopRated(),
        ),
      ],
      child: const HomeTvSeriesScreen(),
    );
  }
}
