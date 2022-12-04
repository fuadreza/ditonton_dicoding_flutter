import 'package:ditonton_dicoding_flutter/domain/entities/movie_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_movie_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_status_movie.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/remove_watchlist_movie.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/save_watchlist_movie.dart';
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
  final GetWatchListStatusMovie getWatchListStatus;
  final SaveWatchlistMovie saveWatchlist;
  final RemoveWatchlistMovie removeWatchlist;

  late MovieDetail movieDetail;
  bool isAddedToWatchList = false;

  void getMovie(int id) async {
    final result = await getMovieDetail.execute(id);
    final resultWatchListStatus = await getWatchListStatus.execute(id);
    result.fold(
      (failure) {
        emit(MovieDetailStateFailed(message: failure.message));
      },
      (movieData) {
        movieDetail = movieData;
        isAddedToWatchList = resultWatchListStatus;
        emit(MovieDetailStateLoaded(movie: movieData, isAddedToWatchList: resultWatchListStatus));
      },
    );
  }

  void addWatchList(MovieDetail movie) async {
    final result = await saveWatchlist.execute(movie);

    await result.fold(
      (failure) async {
        emit(MovieDetailStateLoaded(
          movie: movieDetail,
          isAddedToWatchList: isAddedToWatchList,
          message: failure.message,
        ));
      },
      (successMessage) async {
        isAddedToWatchList = !isAddedToWatchList;
        emit(MovieDetailStateLoaded(
          movie: movieDetail,
          isAddedToWatchList: isAddedToWatchList,
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
          movie: movieDetail,
          isAddedToWatchList: isAddedToWatchList,
          message: failure.message,
        ));
      },
      (successMessage) async {
        isAddedToWatchList = !isAddedToWatchList;
        emit(MovieDetailStateLoaded(
          movie: movieDetail,
          isAddedToWatchList: isAddedToWatchList,
          message: successMessage,
        ));
      },
    );
  }
}
