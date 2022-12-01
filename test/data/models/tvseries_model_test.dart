import 'package:ditonton_dicoding_flutter/data/models/tvseries_model.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/tvseries.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tTvSeriesModel = TvSeriesModel(
    backdropPath: '/path.jpg',
    firstAirDate: '22',
    genreIds: [1,2,3],
    id: 1,
    name: 'name',
    originCountry: ['en'],
    originalLanguage: 'en',
    originalName: 'name origin',
    overview: 'overview',
    popularity: 1000,
    posterPath: '/path.jpg',
    voteAverage: 100.1,
    voteCount: 100,
  );

  final tTvSeries = TvSeries(
    backdropPath: '/path.jpg',
    id: 1,
    originalName: 'name origin',
    overview: 'overview',
    posterPath: '/path.jpg',
  );

  test('should be a subclass of TvSeries entity', () async {
    final result = tTvSeriesModel.toEntity();
    expect(result, tTvSeries);
  });
}
