import 'package:ditonton_dicoding_flutter/domain/entities/movie_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_movie_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/remove_watchlist.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/save_watchlist.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/movie_detail/blocs/detail/movie_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailBloc extends Cubit<MovieDetailState> {
  MovieDetailBloc({
    required this.getMovieDetail,
    required this.getWatchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  }) : super(MovieDetailStateLoading());

  final GetMovieDetail getMovieDetail;
  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  late MovieDetail _movieDetail;
  bool _isAddedToWatchList = false;

  void getMovie(int id) async {
    final result = await getMovieDetail.execute(id);
    final resultWatchListStatus = await getWatchListStatus.execute(id);
    result.fold(
      (failure) {
        emit(MovieDetailStateFailed(message: failure.message));
      },
      (movieData) {
        _movieDetail = movieData;
        _isAddedToWatchList = resultWatchListStatus;
        emit(MovieDetailStateLoaded(movie: movieData, isAddedToWatchList: resultWatchListStatus));
      },
    );
  }

  void addWatchList(MovieDetail movie) async {
    final result = await saveWatchlist.execute(movie);

    await result.fold(
      (failure) async {
        emit(MovieDetailStateLoaded(
          movie: _movieDetail,
          isAddedToWatchList: _isAddedToWatchList,
          message: failure.message,
        ));
      },
      (successMessage) async {
        _isAddedToWatchList = !_isAddedToWatchList;
        emit(MovieDetailStateLoaded(
          movie: _movieDetail,
          isAddedToWatchList: _isAddedToWatchList,
          message: successMessage,
        ));
      },
    );
  }

  void removeFromWatchList(MovieDetail movie) async {
    final result = await removeWatchlist.execute(movie);

    await result.fold(
      (failure) async {
        emit(MovieDetailStateLoaded(
          movie: _movieDetail,
          isAddedToWatchList: _isAddedToWatchList,
          message: failure.message,
        ));
      },
      (successMessage) async {
        _isAddedToWatchList = !_isAddedToWatchList;
        emit(MovieDetailStateLoaded(
          movie: _movieDetail,
          isAddedToWatchList: _isAddedToWatchList,
          message: successMessage,
        ));
      },
    );
  }
}
