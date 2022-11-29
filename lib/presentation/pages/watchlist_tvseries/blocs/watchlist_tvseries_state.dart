import 'package:ditonton_dicoding_flutter/domain/entities/tvseries.dart';
import 'package:equatable/equatable.dart';

class WatchListTvSeriesState extends Equatable {
  const WatchListTvSeriesState();

  @override
  List<Object?> get props => [];
}

class WatchListTvSeriesStateLoading extends WatchListTvSeriesState {}

class WatchListTvSeriesStateLoaded extends WatchListTvSeriesState {
  const WatchListTvSeriesStateLoaded({required this.listTvSeries});

  final List<TvSeries> listTvSeries;

  @override
  List<Object?> get props => [listTvSeries];
}

class WatchListTvSeriesStateFailed extends WatchListTvSeriesState {
  const WatchListTvSeriesStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
