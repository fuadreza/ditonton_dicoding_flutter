import 'package:ditonton_dicoding_flutter/domain/entities/season_detail.dart';
import 'package:equatable/equatable.dart';

class TvSeriesDetailSeasonState extends Equatable {
  const TvSeriesDetailSeasonState();

  @override
  List<Object?> get props => [];
}

class TvSeriesDetailSeasonStateLoading extends TvSeriesDetailSeasonState {}

class TvSeriesDetailSeasonStateLoaded extends TvSeriesDetailSeasonState {
  const TvSeriesDetailSeasonStateLoaded({
    required this.seasonDetail,
  });

  final SeasonDetail seasonDetail;

  @override
  List<Object?> get props => [
        seasonDetail,
      ];
}

class TvSeriesDetailSeasonStateFailed extends TvSeriesDetailSeasonState {
  const TvSeriesDetailSeasonStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
