import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should be a subclass of Episode entity', () async {
    final result = testEpisodeModel.toEntity();
    expect(result, testEpisode);
  });
}