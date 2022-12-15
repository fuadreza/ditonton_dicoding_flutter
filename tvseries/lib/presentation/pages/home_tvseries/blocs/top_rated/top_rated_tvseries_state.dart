import 'package:tvseries/domain/entities/tvseries.dart';
import 'package:equatable/equatable.dart';

class TopRatedTvSeriesState extends Equatable {
  const TopRatedTvSeriesState();

  @override
  List<Object?> get props => [];
}

class TopRatedTvSeriesStateLoading extends TopRatedTvSeriesState {}

class TopRatedTvSeriesStateLoaded extends TopRatedTvSeriesState {
  const TopRatedTvSeriesStateLoaded({required this.listTvSeries});

  final List<TvSeries> listTvSeries;

  @override
  List<Object?> get props => [listTvSeries];
}

class TopRatedTvSeriesStateFailed extends TopRatedTvSeriesState {
  const TopRatedTvSeriesStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
