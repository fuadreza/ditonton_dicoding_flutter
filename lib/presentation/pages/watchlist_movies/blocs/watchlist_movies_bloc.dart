import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/watchlist_movies/blocs/watchlist_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListMoviesBloc extends Cubit<WatchListMoviesState> {
  WatchListMoviesBloc({required this.getWatchlistMovies}) : super(WatchListMoviesStateLoading());

  final GetWatchlistMovies getWatchlistMovies;

  void getWatchlist() async {
    final result = await getWatchlistMovies.execute();
    result.fold(
      (failure) {
        emit(WatchListMoviesStateFailed(message: failure.message));
      },
      (moviesData) {
        emit(WatchListMoviesStateLoaded(listMovie: moviesData));
      },
    );
  }
}
