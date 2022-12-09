import 'package:ditonton_dicoding_flutter/domain/usecases/get_tvseries_season_detail.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/blocs/season/tvseries_detail_season_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvSeriesDetailSeasonBloc extends Cubit<TvSeriesDetailSeasonState> {
  TvSeriesDetailSeasonBloc({
    required this.getTvSeriesSeasonDetail,
  }) : super(TvSeriesDetailSeasonStateLoading());

  final GetTvSeriesSeasonDetail getTvSeriesSeasonDetail;

  void getSeasons(int tvId, int seasonNumber) async {
    final result = await getTvSeriesSeasonDetail.execute(tvId, seasonNumber);
    result.fold(
      (failure) {
        emit(TvSeriesDetailSeasonStateFailed(message: failure.message));
      },
      (tvSeriesData) {
        emit(TvSeriesDetailSeasonStateLoaded(message: 'Success'));
      },
    );
  }
}
