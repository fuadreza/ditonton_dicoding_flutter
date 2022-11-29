import 'package:ditonton_dicoding_flutter/domain/entities/tvseries_detail.dart';
import 'package:equatable/equatable.dart';

class TvSeriesDetailState extends Equatable {
  const TvSeriesDetailState();

  @override
  List<Object?> get props => [];
}

class TvSeriesDetailStateLoading extends TvSeriesDetailState {}

class TvSeriesDetailStateLoaded extends TvSeriesDetailState {
  const TvSeriesDetailStateLoaded({
    required this.tvSeries,
    required this.isAddedToWatchList,
    this.message,
  });

  final TvSeriesDetail tvSeries;
  final bool isAddedToWatchList;
  final String? message;

  @override
  List<Object?> get props => [
        tvSeries,
        isAddedToWatchList,
        message,
      ];
}

class TvSeriesDetailStateFailed extends TvSeriesDetailState {
  const TvSeriesDetailStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
