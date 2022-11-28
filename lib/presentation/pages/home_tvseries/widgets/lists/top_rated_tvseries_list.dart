import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/top_rated/top_rated_tvseries_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/top_rated/top_rated_tvseries_state.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/widgets/lists/tvseries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedTvSeriesList extends StatelessWidget {
  const TopRatedTvSeriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedTvSeriesBloc, TopRatedTvSeriesState>(
      builder: (context, state) {
        if (state is TopRatedTvSeriesStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TopRatedTvSeriesStateLoaded) {
          return TvSeriesList(state.listTvSeries);
        } else if (state is TopRatedTvSeriesStateFailed) {
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
