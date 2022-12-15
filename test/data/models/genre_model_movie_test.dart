import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should be a subclass of Genre entity', () async {
    final result = testGenreModelMovie.toEntity();
    expect(result, testGenreMovie);
  });
}
