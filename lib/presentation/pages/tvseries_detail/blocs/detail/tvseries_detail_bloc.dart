import 'package:ditonton_dicoding_flutter/domain/entities/tvseries_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_tvseries_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_status_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/remove_watchlist_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/save_watchlist_tvseries.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/blocs/detail/tvseries_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvSeriesDetailBloc extends Cubit<TvSeriesDetailState> {
  TvSeriesDetailBloc({
    required this.getTvSeriesDetail,
    required this.getWatchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  }) : super(TvSeriesDetailStateLoading());

  final GetTvSeriesDetail getTvSeriesDetail;
  final GetWatchListStatusTvSeries getWatchListStatus;
  final SaveWatchlistTvSeries saveWatchlist;
  final RemoveWatchlistTvSeries removeWatchlist;

  late TvSeriesDetail _tvSeriesDetail;
  bool _isAddedToWatchList = false;

  void getTvSeries(int id) async {
    final result = await getTvSeriesDetail.execute(id);
    final resultWatchListStatus = await getWatchListStatus.execute(id);
    result.fold(
      (failure) {
        emit(TvSeriesDetailStateFailed(message: failure.message));
      },
      (tvSeriesData) {
        _tvSeriesDetail = tvSeriesData;
        _isAddedToWatchList = resultWatchListStatus;
        emit(TvSeriesDetailStateLoaded(tvSeries: tvSeriesData, isAddedToWatchList: _isAddedToWatchList));
      },
    );
  }

  void addWatchList(TvSeriesDetail tvSeries) async {
    final result = await saveWatchlist.execute(tvSeries);

    await result.fold(
      (failure) async {
        emit(TvSeriesDetailStateLoaded(
          tvSeries: _tvSeriesDetail,
          isAddedToWatchList: _isAddedToWatchList,
          message: failure.message,
        ));
      },
      (successMessage) async {
        _isAddedToWatchList = !_isAddedToWatchList;
        emit(TvSeriesDetailStateLoaded(
          tvSeries: _tvSeriesDetail,
          isAddedToWatchList: _isAddedToWatchList,
          message: successMessage,
        ));
      },
    );
  }

  void removeFromWatchList(TvSeriesDetail tvSeries) async {
    final result = await removeWatchlist.execute(tvSeries);

    await result.fold(
      (failure) async {
        emit(TvSeriesDetailStateLoaded(
          tvSeries: _tvSeriesDetail,
          isAddedToWatchList: _isAddedToWatchList,
          message: failure.message,
        ));
      },
      (successMessage) async {
        _isAddedToWatchList = !_isAddedToWatchList;
        emit(TvSeriesDetailStateLoaded(
          tvSeries: _tvSeriesDetail,
          isAddedToWatchList: _isAddedToWatchList,
          message: successMessage,
        ));
      },
    );
  }
}
