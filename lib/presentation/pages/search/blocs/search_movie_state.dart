import 'package:ditonton_dicoding_flutter/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object?> get props => [];
}

class SearchMovieStateInit extends SearchMovieState {}

class SearchMovieStateLoading extends SearchMovieState {}

class SearchMovieStateLoaded extends SearchMovieState {
  const SearchMovieStateLoaded({required this.listMovie});

  final List<Movie> listMovie;

  @override
  List<Object?> get props => [listMovie];
}

class SearchMovieStateFailed extends SearchMovieState {
  const SearchMovieStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
