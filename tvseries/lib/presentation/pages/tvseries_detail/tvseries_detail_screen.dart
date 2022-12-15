import 'package:tvseries/presentation/pages/tvseries_detail/blocs/detail/tvseries_detail_bloc.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/blocs/detail/tvseries_detail_state.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/widgets/contents/detail_tvseries_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvSeriesDetailScreen extends StatelessWidget {
  const TvSeriesDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TvSeriesDetailBloc, TvSeriesDetailState>(
        listener: (context, state) {
          if (state is TvSeriesDetailStateLoaded) {
            if (state.message != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${state.message}'),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          if (state is TvSeriesDetailStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TvSeriesDetailStateLoaded) {
            return SafeArea(
              child: DetailTvSeriesContent(
                state.tvSeries,
                state.isAddedToWatchList,
              ),
            );
          } else if (state is TvSeriesDetailStateFailed) {
            return Center(
              key: const Key('error_message'),
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text('Unknown'),
            );
          }
        },
      ),
    );
  }
}
