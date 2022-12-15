import 'package:movie/domain/usecases/get_movie_recommendations.dart';
import 'package:movie/presentation/pages/movie_detail/blocs/recommendation/movie_recommendation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieRecommendationBloc extends Cubit<MovieRecommendationState> {
  MovieRecommendationBloc({required this.getMovieRecommendations}) : super(MovieRecommendationStateLoading());

  final GetMovieRecommendations getMovieRecommendations;

  void getRecommendations(int id) async {
    final result = await getMovieRecommendations.execute(id);
    result.fold(
      (failure) {
        emit(MovieRecommendationStateFailed(message: failure.message));
      },
      (moviesData) {
        emit(MovieRecommendationStateLoaded(listMovie: moviesData));
      },
    );
  }
}
