import 'package:ditonton_dicoding_flutter/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home/blocs/now_playing/now_playing_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingMovieBloc extends Cubit<NowPlayingMovieState> {
  NowPlayingMovieBloc({required this.getNowPlayingMovies}) : super(NowPlayingMovieStateLoading());

  final GetNowPlayingMovies getNowPlayingMovies;

  void getNowPlaying() async {
    final result = await getNowPlayingMovies.execute();
    result.fold(
      (failure) {
        emit(NowPlayingMovieStateFailed(message: failure.message));
      },
      (moviesData) {
        emit(NowPlayingMovieStateLoaded(listMovie: moviesData));
      },
    );
  }
}
