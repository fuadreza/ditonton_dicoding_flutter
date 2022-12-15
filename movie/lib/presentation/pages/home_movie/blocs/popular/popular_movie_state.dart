import 'package:movie/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

class PopularMovieState extends Equatable {
  const PopularMovieState();

  @override
  List<Object?> get props => [];
}

class PopularMovieStateLoading extends PopularMovieState {}

class PopularMovieStateLoaded extends PopularMovieState {
  const PopularMovieStateLoaded({required this.listMovie});

  final List<Movie> listMovie;

  @override
  List<Object?> get props => [listMovie];
}

class PopularMovieStateFailed extends PopularMovieState {
  const PopularMovieStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
