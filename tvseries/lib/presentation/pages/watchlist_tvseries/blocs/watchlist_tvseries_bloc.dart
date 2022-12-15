import 'package:tvseries/domain/usecases/get_watchlist_tvseries.dart';
import 'package:tvseries/presentation/pages/watchlist_tvseries/blocs/watchlist_tvseries_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListTvSeriesBloc extends Cubit<WatchListTvSeriesState> {
  WatchListTvSeriesBloc({required this.getWatchlistTvSeries}) : super(WatchListTvSeriesStateLoading());

  final GetWatchlistTvSeries getWatchlistTvSeries;

  void getWatchlist() async {
    final result = await getWatchlistTvSeries.execute();
    result.fold(
      (failure) {
        emit(WatchListTvSeriesStateFailed(message: failure.message));
      },
      (tvSeriesData) {
        emit(WatchListTvSeriesStateLoaded(listTvSeries: tvSeriesData));
      },
    );
  }
}
