import 'package:ditonton_dicoding_flutter/domain/entities/tvseries.dart';
import 'package:equatable/equatable.dart';

class NowPlayingTvSeriesState extends Equatable {
  const NowPlayingTvSeriesState();

  @override
  List<Object?> get props => [];
}

class NowPlayingTvSeriesStateLoading extends NowPlayingTvSeriesState {}

class NowPlayingTvSeriesStateLoaded extends NowPlayingTvSeriesState {
  const NowPlayingTvSeriesStateLoaded({required this.listTvSeries});

  final List<TvSeries> listTvSeries;

  @override
  List<Object?> get props => [listTvSeries];
}

class NowPlayingTvSeriesStateFailed extends NowPlayingTvSeriesState {
  const NowPlayingTvSeriesStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
