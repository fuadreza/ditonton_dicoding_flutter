import 'package:tvseries/domain/entities/tvseries.dart';
import 'package:equatable/equatable.dart';

class PopularTvSeriesState extends Equatable {
  const PopularTvSeriesState();

  @override
  List<Object?> get props => [];
}

class PopularTvSeriesStateLoading extends PopularTvSeriesState {}

class PopularTvSeriesStateLoaded extends PopularTvSeriesState {
  const PopularTvSeriesStateLoaded({required this.listTvSeries});

  final List<TvSeries> listTvSeries;

  @override
  List<Object?> get props => [listTvSeries];
}

class PopularTvSeriesStateFailed extends PopularTvSeriesState {
  const PopularTvSeriesStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
