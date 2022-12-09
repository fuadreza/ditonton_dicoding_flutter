import 'package:ditonton_dicoding_flutter/domain/entities/genre.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/season.dart';
import 'package:equatable/equatable.dart';

class TvSeriesDetail extends Equatable {
  const TvSeriesDetail({
    required this.adult,
    required this.backdropPath,
    required this.firstAirDate,
    required this.genres,
    required this.id,
    required this.name,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.seasons,
  });

  final bool adult;
  final String? backdropPath;
  final String firstAirDate;
  final List<Genre> genres;
  final int id;
  final String name;
  final String originalName;
  final String overview;
  final String? posterPath;
  final double voteAverage;
  final int voteCount;
  final List<Season> seasons;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        firstAirDate,
        genres,
        id,
        name,
        originalName,
        overview,
        posterPath,
        voteAverage,
        voteCount,
        seasons,
      ];
}
