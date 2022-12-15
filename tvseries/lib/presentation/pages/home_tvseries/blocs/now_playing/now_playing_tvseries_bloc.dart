import 'package:tvseries/domain/usecases/get_now_playing_tvseries.dart';
import 'package:tvseries/presentation/pages/home_tvseries/blocs/now_playing/now_playing_tvseries_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingTvSeriesBloc extends Cubit<NowPlayingTvSeriesState> {
  NowPlayingTvSeriesBloc({required this.getNowPlayingTvSeries}) : super(NowPlayingTvSeriesStateLoading());

  final GetNowPlayingTvSeries getNowPlayingTvSeries;

  void getNowPlaying() async {
    final result = await getNowPlayingTvSeries.execute();
    result.fold(
      (failure) {
        emit(NowPlayingTvSeriesStateFailed(message: failure.message));
      },
      (tvSeriesData) {
        emit(NowPlayingTvSeriesStateLoaded(listTvSeries: tvSeriesData));
      },
    );
  }
}
