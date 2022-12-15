import 'package:tvseries/domain/entities/tvseries.dart';
import 'package:equatable/equatable.dart';

class SearchTvSeriesState extends Equatable {
  const SearchTvSeriesState();

  @override
  List<Object?> get props => [];
}

class SearchTvSeriesStateInit extends SearchTvSeriesState {}

class SearchTvSeriesStateLoading extends SearchTvSeriesState {}

class SearchTvSeriesStateLoaded extends SearchTvSeriesState {
  const SearchTvSeriesStateLoaded({required this.listTvSeries});

  final List<TvSeries> listTvSeries;

  @override
  List<Object?> get props => [listTvSeries];
}

class SearchTvSeriesStateFailed extends SearchTvSeriesState {
  const SearchTvSeriesStateFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
