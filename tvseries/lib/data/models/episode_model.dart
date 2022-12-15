import 'package:tvseries/domain/entities/episode.dart';
import 'package:equatable/equatable.dart';

class EpisodesModel extends Equatable {
  const EpisodesModel({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.runtime,
    this.seasonNumber,
    this.voteAverage,
    this.voteCount,
  });

  final String? airDate;
  final int? episodeNumber;
  final int? id;
  final String? name;
  final String? overview;
  final int? runtime;
  final int? seasonNumber;
  final double? voteAverage;
  final int? voteCount;

  factory EpisodesModel.fromJson(Map<String, dynamic> json) {
    return EpisodesModel(
      airDate: json['air_date'],
      episodeNumber: json['episode_number'],
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      runtime: json['runtime'],
      seasonNumber: json['season_number'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['air_date'] = airDate;
    data['episode_number'] = episodeNumber;
    data['id'] = id;
    data['name'] = name;
    data['overview'] = overview;
    data['runtime'] = runtime;
    data['season_number'] = seasonNumber;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }

  Episode toEntity() {
    return Episode(
      airDate: airDate ?? '',
      episodeNumber: episodeNumber ?? 1,
      id: id ?? 0,
      name: name ?? '',
      overview: overview ?? '',
      runtime: runtime ?? 1,
      seasonNumber: seasonNumber ?? 1,
      voteAverage: voteAverage ?? 1,
      voteCount: voteCount ?? 1,
    );
  }

  @override
  List<Object?> get props => [
        airDate,
        episodeNumber,
        id,
        name,
        overview,
        runtime,
        seasonNumber,
        voteAverage,
        voteCount,
      ];
}
