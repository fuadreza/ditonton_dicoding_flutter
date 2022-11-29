import 'package:ditonton_dicoding_flutter/domain/usecases/get_tvseries_recommendations.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/blocs/recommendation/tvseries_recommendation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvSeriesRecommendationBloc extends Cubit<TvSeriesRecommendationState> {
  TvSeriesRecommendationBloc({required this.getTvSeriesRecommendations}) : super(TvSeriesRecommendationStateLoading());

  final GetTvSeriesRecommendations getTvSeriesRecommendations;

  void getRecommendations(int id) async {
    final result = await getTvSeriesRecommendations.execute(id);
    result.fold(
      (failure) {
        emit(TvSeriesRecommendationStateFailed(message: failure.message));
      },
      (moviesData) {
        emit(TvSeriesRecommendationStateLoaded(listTvSeries: moviesData));
      },
    );
  }
}
