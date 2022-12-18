import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/data/models/season_model.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should be a subclass of Season entity', () async {
    final result = testSeasonModel.toEntity();
    expect(result, testSeason);
  });

  test('should be a Map', () async {
    final result = testSeasonModel.toJson();
    expect(result, testSeasonModelMap);
  });

  test('should be from Map', () async {
    final result = SeasonModel.fromJson(testSeasonModelMap);
    expect(result, testSeasonModel);
  });
}
