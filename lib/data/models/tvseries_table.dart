import 'package:ditonton_dicoding_flutter/domain/entities/tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/tvseries_detail.dart';
import 'package:equatable/equatable.dart';

class TvSeriesTable extends Equatable {
  final int id;
  final String? originalName;
  final String? posterPath;
  final String? overview;

  const TvSeriesTable({
    required this.id,
    required this.originalName,
    required this.posterPath,
    required this.overview,
  });

  factory TvSeriesTable.fromEntity(TvSeriesDetail tvSeries) => TvSeriesTable(
        id: tvSeries.id,
        originalName: tvSeries.originalName,
        posterPath: tvSeries.posterPath,
        overview: tvSeries.overview,
      );

  factory TvSeriesTable.fromMap(Map<String, dynamic> map) => TvSeriesTable(
        id: map['id'],
        originalName: map['originalName'],
        posterPath: map['posterPath'],
        overview: map['overview'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'originalName': originalName,
        'posterPath': posterPath,
        'overview': overview,
      };

  TvSeries toEntity() => TvSeries.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        originalName: originalName,
      );

  @override
  List<Object?> get props => [
        id,
        originalName,
        posterPath,
        overview,
      ];
}
