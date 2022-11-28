import 'package:ditonton_dicoding_flutter/injection.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/now_playing/now_playing_tvseries_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/home_tvseries_screen.dart';
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
      ],
      child: const HomeTvSeriesScreen(),
    );
  }
}
