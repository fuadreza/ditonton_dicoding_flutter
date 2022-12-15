import 'dart:convert';

import 'package:tvseries/data/models/tvseries_model.dart';
import 'package:tvseries/data/models/tvseries_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  const tTvSeriesModel = TvSeriesModel(
    backdropPath: '/path.jpg',
    firstAirDate: '2022-10-20',
    genreIds: [10765,18],
    id: 95403,
    name: 'The Peripheral',
    originCountry: ['US'],
    originalLanguage: 'en',
    originalName: 'The Peripheral',
    overview: 'Stuck in a small Appalachian town, a young woman only',
    popularity: 1756.917,
    posterPath: '/path.jpg',
    voteAverage: 8.2,
    voteCount: 308,
  );
  const tTvSeriesResponseModel = TvSeriesResponse(tvSeriesList: <TvSeriesModel>[tTvSeriesModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(readJson('dummy_data/now_playing_tvseries.json'));
      // act
      final result = TvSeriesResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvSeriesResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvSeriesResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/path.jpg",
            "first_air_date": "2022-10-20",
            "genre_ids": [
              10765,
              18
            ],
            "id": 95403,
            "name": "The Peripheral",
            "origin_country": [
              "US"
            ],
            "original_language": "en",
            "original_name": "The Peripheral",
            "overview": "Stuck in a small Appalachian town, a young woman only",
            "popularity": 1756.917,
            "poster_path": "/path.jpg",
            "vote_average": 8.2,
            "vote_count": 308
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
