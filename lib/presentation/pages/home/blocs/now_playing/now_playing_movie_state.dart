import 'package:ditonton_dicoding_flutter/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

class NowPlayingMovieState extends Equatable {
  const NowPlayingMovieState();

  @override
  List<Object?> get props => [];
}

class NowPlayingMovieStateLoading extends NowPlayingMovieState {}

class NowPlayingMovieStateLoaded extends NowPlayingMovieState {
  const NowPlayingMovieStateLoaded({required this.listMovie});

  final List<Movie> listMovie;

  @override
  List<Object?> get props => [listMovie];
}

class NowPlayingMovieStateFailed extends NowPlayingMovieState {
  const NowPlayingMovieStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
