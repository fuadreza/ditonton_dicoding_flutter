import 'package:movie/domain/usecases/search_movies.dart';
import 'package:movie/presentation/pages/search_movie/blocs/search_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchMovieBloc extends Cubit<SearchMovieState> {
  SearchMovieBloc({required this.searchMovies}) : super(SearchMovieStateInit());

  final SearchMovies searchMovies;

  void searchMovieByQuery(String query) async {
    emit(SearchMovieStateLoading());
    final result = await searchMovies.execute(query);
    result.fold(
      (failure) {
        emit(SearchMovieStateFailed(message: failure.message));
      },
      (moviesData) {
        emit(SearchMovieStateLoaded(listMovie: moviesData));
      },
    );
  }
}
