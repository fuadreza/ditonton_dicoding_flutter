import 'package:movie/domain/usecases/get_top_rated_movies.dart';
import 'package:movie/presentation/pages/home_movie/blocs/top_rated/top_rated_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMovieBloc extends Cubit<TopRatedMovieState> {
  TopRatedMovieBloc({required this.getTopRatedMovies}) : super(TopRatedMovieStateLoading());

  final GetTopRatedMovies getTopRatedMovies;

  void getTopRated() async {
    final result = await getTopRatedMovies.execute();
    result.fold(
      (failure) {
        emit(TopRatedMovieStateFailed(message: failure.message));
      },
      (moviesData) {
        emit(TopRatedMovieStateLoaded(listMovie: moviesData));
      },
    );
  }
}
