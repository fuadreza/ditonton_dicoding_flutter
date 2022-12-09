import 'package:ditonton_dicoding_flutter/domain/entities/season.dart';
import 'package:equatable/equatable.dart';

class SeasonModel extends Equatable {
  const SeasonModel({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.posterPath,
    required this.seasonNumber,
  });

  final String? airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String? posterPath;
  final int seasonNumber;

  factory SeasonModel.fromJson(json) {
    return SeasonModel(
      airDate: json['air_date'],
      episodeCount: json['episode_count'],
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'],
      seasonNumber: json['season_number'],
    );
  }

  static List<SeasonModel> toList(json) {
    final List list = json as List<dynamic>;
    final List<SeasonModel> listMapped = list.map<SeasonModel>(SeasonModel.fromJson).toList();
    return listMapped;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['air_date'] = airDate;
    data['episode_count'] = episodeCount;
    data['id'] = id;
    data['name'] = name;
    data['poster_path'] = posterPath;
    data['season_number'] = seasonNumber;
    return data;
  }

  Season toEntity() {
    return Season(
      airDate: airDate,
      episodeCount: episodeCount,
      id: id,
      name: name,
      posterPath: posterPath,
      seasonNumber: seasonNumber,
    );
  }

  @override
  List<Object?> get props => [
        airDate,
        episodeCount,
        id,
        name,
        posterPath,
        seasonNumber,
      ];
}
