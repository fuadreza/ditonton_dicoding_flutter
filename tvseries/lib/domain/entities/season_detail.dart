import 'package:equatable/equatable.dart';
import 'package:tvseries/domain/entities/episode.dart';

class SeasonDetail extends Equatable {
  const SeasonDetail({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.posterPath,
    required this.seasonNumber,
    required this.episodes,
  });

  final String airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String? posterPath;
  final int seasonNumber;
  final List<Episode> episodes;

  @override
  List<Object?> get props => [
        airDate,
        episodeCount,
        id,
        name,
        posterPath,
        seasonNumber,
        episodes,
      ];
}
