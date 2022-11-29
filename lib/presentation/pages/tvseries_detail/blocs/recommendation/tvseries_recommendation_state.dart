import 'package:ditonton_dicoding_flutter/domain/entities/tvseries.dart';
import 'package:equatable/equatable.dart';

class TvSeriesRecommendationState extends Equatable {
  const TvSeriesRecommendationState();

  @override
  List<Object?> get props => [];
}

class TvSeriesRecommendationStateLoading extends TvSeriesRecommendationState {}

class TvSeriesRecommendationStateLoaded extends TvSeriesRecommendationState {
  const TvSeriesRecommendationStateLoaded({required this.listTvSeries});

  final List<TvSeries> listTvSeries;

  @override
  List<Object?> get props => [listTvSeries];
}

class TvSeriesRecommendationStateFailed extends TvSeriesRecommendationState {
  const TvSeriesRecommendationStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
