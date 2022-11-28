import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/popular/popular_tvseries_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/popular/popular_tvseries_state.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/widgets/lists/tvseries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularTvSeriesList extends StatelessWidget {
  const PopularTvSeriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularTvSeriesBloc, PopularTvSeriesState>(
      builder: (context, state) {
        if (state is PopularTvSeriesStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PopularTvSeriesStateLoaded) {
          return TvSeriesList(state.listTvSeries);
        } else if (state is PopularTvSeriesStateFailed) {
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
