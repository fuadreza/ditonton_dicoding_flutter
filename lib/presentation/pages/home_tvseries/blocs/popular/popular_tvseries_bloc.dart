import 'package:ditonton_dicoding_flutter/domain/usecases/get_popular_tvseries.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/popular/popular_tvseries_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularTvSeriesBloc extends Cubit<PopularTvSeriesState> {
  PopularTvSeriesBloc({required this.getPopularTvSeries}) : super(PopularTvSeriesStateLoading());

  final GetPopularTvSeries getPopularTvSeries;

  void getPopular() async {
    final result = await getPopularTvSeries.execute();
    result.fold(
      (failure) {
        emit(PopularTvSeriesStateFailed(message: failure.message));
      },
      (tvSeriesData) {
        emit(PopularTvSeriesStateLoaded(listTvSeries: tvSeriesData));
      },
    );
  }
}
