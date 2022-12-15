import 'package:tvseries/data/models/episode_model.dart';
import 'package:tvseries/domain/entities/season_detail.dart';
import 'package:equatable/equatable.dart';

class SeasonDetailModel extends Equatable {
  const SeasonDetailModel({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.posterPath,
    required this.seasonNumber,
    required this.episodes,
  });

  final String? airDate;
  final int? episodeCount;
  final int? id;
  final String? name;
  final String? posterPath;
  final int? seasonNumber;
  final List<EpisodesModel>? episodes;

  factory SeasonDetailModel.fromJson(json) {
    return SeasonDetailModel(
      airDate: json['air_date'],
      episodeCount: json['episode_count'],
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'],
      seasonNumber: json['season_number'],
      episodes: List<EpisodesModel>.from((json["episodes"] ?? []).map((x) => EpisodesModel.fromJson(x))),
    );
  }

  static List<SeasonDetailModel> toList(json) {
    final List list = json as List<dynamic>;
    final List<SeasonDetailModel> listMapped = list.map<SeasonDetailModel>(SeasonDetailModel.fromJson).toList();
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
    data['season_number'] = seasonNumber;
    data['episodes'] = (episodes ?? []).map((v) => v.toJson()).toList();
    return data;
  }

  SeasonDetail toEntity() {
    return SeasonDetail(
      airDate: airDate ?? '-',
      episodeCount: episodeCount ?? 1,
      id: id ?? 0,
      name: name ?? '-',
      posterPath: posterPath,
      seasonNumber: seasonNumber ?? 1,
      episodes: (episodes ?? []).map((episode) => episode.toEntity()).toList(),
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
        episodes,
      ];
}
