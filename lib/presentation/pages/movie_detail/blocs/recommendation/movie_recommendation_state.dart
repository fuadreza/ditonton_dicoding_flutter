import 'package:ditonton_dicoding_flutter/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

class MovieRecommendationState extends Equatable {
  const MovieRecommendationState();

  @override
  List<Object?> get props => [];
}

class MovieRecommendationStateLoading extends MovieRecommendationState {}

class MovieRecommendationStateLoaded extends MovieRecommendationState {
  const MovieRecommendationStateLoaded({required this.listMovie});

  final List<Movie> listMovie;

  @override
  List<Object?> get props => [listMovie];
}

class MovieRecommendationStateFailed extends MovieRecommendationState {
  const MovieRecommendationStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
