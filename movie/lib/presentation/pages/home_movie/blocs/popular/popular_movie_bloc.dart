import 'package:movie/domain/usecases/get_popular_movies.dart';
import 'package:movie/presentation/pages/home_movie/blocs/popular/popular_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMovieBloc extends Cubit<PopularMovieState> {
  PopularMovieBloc({required this.getPopularMovies}) : super(PopularMovieStateLoading());

  final GetPopularMovies getPopularMovies;

  void getPopular() async {
    final result = await getPopularMovies.execute();
    result.fold(
      (failure) {
        emit(PopularMovieStateFailed(message: failure.message));
      },
      (moviesData) {
        emit(PopularMovieStateLoaded(listMovie: moviesData));
      },
    );
  }
}
