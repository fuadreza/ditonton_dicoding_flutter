import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/data/models/season_detail_model.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should be a subclass of Season Detail entity', () async {
    final result = testSeasonDetailModel.toEntity();
    expect(result, testSeasonDetail);
  });

  test('should be a Map', () async {
    final result = testSeasonDetailModel.toJson();
    expect(result, testSeasonDetailMap);
  });

  test('should be a List', () async {
    final result = SeasonDetailModel.toList(testSeasonDetailMapList);
    expect(result, [testSeasonDetailModel]);
  });

  test('should be from Map', () async {
    final result = SeasonDetailModel.fromJson(testSeasonDetailMap);
    expect(result, testSeasonDetailModel);
  });
}
