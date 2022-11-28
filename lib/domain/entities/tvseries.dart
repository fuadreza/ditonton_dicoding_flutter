import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TvSeries extends Equatable {
  TvSeries({
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.originalName,
  });

  TvSeries.watchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.originalName,
  });

  String? backdropPath;
  int id;
  String? overview;
  String? posterPath;
  String? originalName;

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        posterPath,
        originalName,
      ];
}
