import 'package:tvseries/domain/entities/season.dart';
import 'package:equatable/equatable.dart';

class SeasonModel extends Equatable {
  const SeasonModel({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.seasonNumber,
  });

  final int id;
  final String name;
  final String? posterPath;
  final int seasonNumber;

  factory SeasonModel.fromJson(json) {
    return SeasonModel(
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
    data['id'] = id;
    data['name'] = name;
    data['poster_path'] = posterPath;
    data['season_number'] = seasonNumber;
    return data;
  }

  Season toEntity() {
    return Season(
      id: id,
      name: name,
      posterPath: posterPath,
      seasonNumber: seasonNumber,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        posterPath,
        seasonNumber,
      ];
}
