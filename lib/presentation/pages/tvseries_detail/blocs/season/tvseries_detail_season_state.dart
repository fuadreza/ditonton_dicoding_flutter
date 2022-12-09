import 'package:equatable/equatable.dart';

class TvSeriesDetailSeasonState extends Equatable {
  const TvSeriesDetailSeasonState();

  @override
  List<Object?> get props => [];
}

class TvSeriesDetailSeasonStateLoading extends TvSeriesDetailSeasonState {}

class TvSeriesDetailSeasonStateLoaded extends TvSeriesDetailSeasonState {
  const TvSeriesDetailSeasonStateLoaded({
    this.message,
  });

  final String? message;

  @override
  List<Object?> get props => [
        message,
      ];
}

class TvSeriesDetailSeasonStateFailed extends TvSeriesDetailSeasonState {
  const TvSeriesDetailSeasonStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
