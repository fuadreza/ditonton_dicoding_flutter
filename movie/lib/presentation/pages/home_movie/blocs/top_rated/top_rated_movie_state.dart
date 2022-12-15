import 'package:movie/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

class TopRatedMovieState extends Equatable {
  const TopRatedMovieState();

  @override
  List<Object?> get props => [];
}

class TopRatedMovieStateLoading extends TopRatedMovieState {}

class TopRatedMovieStateLoaded extends TopRatedMovieState {
  const TopRatedMovieStateLoaded({required this.listMovie});

  final List<Movie> listMovie;

  @override
  List<Object?> get props => [listMovie];
}

class TopRatedMovieStateFailed extends TopRatedMovieState {
  const TopRatedMovieStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
