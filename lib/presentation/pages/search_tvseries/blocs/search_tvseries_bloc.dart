import 'package:ditonton_dicoding_flutter/domain/usecases/search_tvseries.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/search_tvseries/blocs/search_tvseries_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTvSeriesBloc extends Cubit<SearchTvSeriesState> {
  SearchTvSeriesBloc({required this.searchTvSeries}) : super(SearchTvSeriesStateInit());

  final SearchTvSeries searchTvSeries;

  void searchTvSeriesByQuery(String query) async {
    emit(SearchTvSeriesStateLoading());
    final result = await searchTvSeries.execute(query);
    result.fold(
      (failure) {
        emit(SearchTvSeriesStateFailed(message: failure.message));
      },
      (moviesData) {
        emit(SearchTvSeriesStateLoaded(listTvSeries: moviesData));
      },
    );
  }
}
