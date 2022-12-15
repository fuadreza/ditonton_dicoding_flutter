import 'package:core/enums/list_direction.dart';
import 'package:tvseries/presentation/pages/home_tvseries/blocs/top_rated/top_rated_tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/home_tvseries/blocs/top_rated/top_rated_tvseries_state.dart';
import 'package:tvseries/presentation/pages/home_tvseries/widgets/lists/tvseries_list.dart';
import 'package:tvseries/presentation/widgets/tvseries_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedTvSeriesList extends StatelessWidget {
  const TopRatedTvSeriesList({
    Key? key,
    this.listDirection = ListDirection.horizontal,
  }) : super(key: key);

  final ListDirection listDirection;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedTvSeriesBloc, TopRatedTvSeriesState>(
      builder: (context, state) {
        if (state is TopRatedTvSeriesStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TopRatedTvSeriesStateLoaded) {
          if (listDirection == ListDirection.horizontal) {
            return TvSeriesList(state.listTvSeries);
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                final tvSeries = state.listTvSeries[index];
                return TvSeriesCard(tvSeries);
              },
              itemCount: state.listTvSeries.length,
            );
          }
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
