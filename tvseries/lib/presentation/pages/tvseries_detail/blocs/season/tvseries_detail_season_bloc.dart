import 'package:tvseries/domain/usecases/get_tvseries_season_detail.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/blocs/season/tvseries_detail_season_state.dart';
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
      (data) {
        emit(TvSeriesDetailSeasonStateLoaded(seasonDetail: data));
      },
    );
  }
}
