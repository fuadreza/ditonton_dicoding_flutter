import 'package:ditonton_dicoding_flutter/presentation/pages/search_tvseries/blocs/search_tvseries_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/search_tvseries/blocs/search_tvseries_state.dart';
import 'package:ditonton_dicoding_flutter/presentation/widgets/tvseries_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTvSeriesList extends StatelessWidget {
  const SearchTvSeriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchTvSeriesBloc, SearchTvSeriesState>(
      builder: (context, state) {
        if (state is SearchTvSeriesStateInit) {
          return const Expanded(
            child: Center(
              child: Text('Search tv series by title'),
            ),
          );
        } else if (state is SearchTvSeriesStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchTvSeriesStateLoaded) {
          if (state.listTvSeries.isNotEmpty) {
            return Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return TvSeriesCard(state.listTvSeries[index]);
                },
                itemCount: state.listTvSeries.length,
              ),
            );
          } else {
            return const Expanded(
              child: Center(
                child: Text('Tidak ditemukan'),
              ),
            );
          }
        } else if (state is SearchTvSeriesStateFailed) {
          return Expanded(
            child: Center(
              key: const Key('error_message'),
              child: Text(state.message),
            ),
          );
        } else {
          return const Expanded(
            child: Center(
              child: SizedBox(),
            ),
          );
        }
      },
    );
  }
}
