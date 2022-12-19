import 'package:tvseries/data/models/tvseries_detail_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {

  test('should be a subclass of TvSeries Detail entity', () async {
    final result = testTvSeriesDetailModel.toEntity();
    expect(result, testTvSeriesDetail);
  });

  test('should be a Map', () async {
    final result = testTvSeriesDetailModel.toJson();
    expect(result, testTvSeriesDetailModelMap);
  });

  test('should be from Map', () async {
    final result = TvSeriesDetailModel.fromJson(testTvSeriesDetailModelMap);
    expect(result, testTvSeriesDetailModel);
  });

  test('should return genres', () async {
    final result = testTvSeriesDetail.showGenres();
    expect(result, testTvSeriesDetail.genres.first.name);
  });
}
