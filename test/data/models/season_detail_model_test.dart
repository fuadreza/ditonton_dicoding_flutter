import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should be a subclass of Season entity', () async {
    final result = testSeasonModel.toEntity();
    expect(result, testSeason);
  });
}
