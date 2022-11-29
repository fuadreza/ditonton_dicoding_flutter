import 'package:ditonton_dicoding_flutter/presentation/pages/watchlist_tvseries/blocs/watchlist_tvseries_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/watchlist_tvseries/blocs/watchlist_tvseries_state.dart';
import 'package:ditonton_dicoding_flutter/presentation/widgets/tvseries_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListTvSeriesList extends StatelessWidget {
  const WatchListTvSeriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListTvSeriesBloc, WatchListTvSeriesState>(
      builder: (context, state) {
        if (state is WatchListTvSeriesStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WatchListTvSeriesStateLoaded) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return TvSeriesCard(state.listTvSeries[index]);
            },
            itemCount: state.listTvSeries.length,
          );
        } else if (state is WatchListTvSeriesStateFailed) {
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
