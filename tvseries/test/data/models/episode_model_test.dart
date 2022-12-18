import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/data/models/episode_model.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should be a subclass of Episode entity', () async {
    final result = testEpisodeModel.toEntity();
    expect(result, testEpisode);
  });

  test('should be a Map', () async {
    final result = testEpisodeModel.toJson();
    expect(result, testEpisodeMap);
  });

  test('should be from Map', () async {
    final result = EpisodesModel.fromJson(testEpisodeMap);
    expect(result, testEpisodeModel);
  });
}
