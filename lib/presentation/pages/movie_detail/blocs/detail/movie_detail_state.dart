import 'package:ditonton_dicoding_flutter/domain/entities/movie_detail.dart';
import 'package:equatable/equatable.dart';

class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object?> get props => [];
}

class MovieDetailStateLoading extends MovieDetailState {}

class MovieDetailStateLoaded extends MovieDetailState {
  const MovieDetailStateLoaded({
    required this.movie,
    required this.isAddedToWatchList,
  });

  final MovieDetail movie;
  final bool isAddedToWatchList;

  @override
  List<Object?> get props => [
        movie,
        isAddedToWatchList,
      ];
}

class MovieDetailStateFailed extends MovieDetailState {
  const MovieDetailStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
