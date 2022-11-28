import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/now_playing/now_playing_movie_state.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/now_playing/now_playing_tvseries_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/widgets/lists/tvseries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingTvSeriesList extends StatelessWidget {
  const NowPlayingTvSeriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingTvSeriesBloc, NowPlayingTvSeriesState>(
      builder: (context, state) {
        if (state is NowPlayingTvSeriesStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NowPlayingTvSeriesStateLoaded) {
          return TvSeriesList(state.listTvSeries);
        } else if (state is NowPlayingTvSeriesStateFailed) {
          return Center(
            key: const Key('error_message'),
            child: Text(state.message),
          );
        } else {
          return const Center(child: Text('Failed'));
        }
      },
    );
  }
}
