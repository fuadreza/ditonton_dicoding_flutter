import 'package:ditonton_dicoding_flutter/domain/entities/movie.dart';
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

  final List<Movie> listRecommendationMovies = [];

  void getMovie(int id) async {
    final result = await getMovieDetail.execute(id);
    final resultWatchListStatus = await getWatchListStatus.execute(id);
    result.fold(
      (failure) {
        emit(MovieDetailStateFailed(message: failure.message));
      },
      (movieData) {
        emit(MovieDetailStateLoaded(movie: movieData, isAddedToWatchList: resultWatchListStatus));
      },
    );
  }
}
