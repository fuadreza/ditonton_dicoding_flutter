import 'package:tvseries/domain/usecases/get_top_rated_tvseries.dart';
import 'package:tvseries/presentation/pages/home_tvseries/blocs/top_rated/top_rated_tvseries_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedTvSeriesBloc extends Cubit<TopRatedTvSeriesState> {
  TopRatedTvSeriesBloc({required this.getTopRatedTvSeries}) : super(TopRatedTvSeriesStateLoading());

  final GetTopRatedTvSeries getTopRatedTvSeries;

  void getTopRated() async {
    final result = await getTopRatedTvSeries.execute();
    result.fold(
      (failure) {
        emit(TopRatedTvSeriesStateFailed(message: failure.message));
      },
      (tvSeriesData) {
        emit(TopRatedTvSeriesStateLoaded(listTvSeries: tvSeriesData));
      },
    );
  }
}
