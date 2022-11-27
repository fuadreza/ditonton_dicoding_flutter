import 'package:ditonton_dicoding_flutter/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

class WatchListMoviesState extends Equatable {
  const WatchListMoviesState();

  @override
  List<Object?> get props => [];
}

class WatchListMoviesStateLoading extends WatchListMoviesState {}

class WatchListMoviesStateLoaded extends WatchListMoviesState {
  const WatchListMoviesStateLoaded({required this.listMovie});

  final List<Movie> listMovie;

  @override
  List<Object?> get props => [listMovie];
}

class WatchListMoviesStateFailed extends WatchListMoviesState {
  const WatchListMoviesStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
