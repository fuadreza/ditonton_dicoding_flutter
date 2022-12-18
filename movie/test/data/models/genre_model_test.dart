import 'package:flutter_test/flutter_test.dart';
import 'package:movie/data/models/genre_model.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  test('should be a subclass of Genre entity', () async {
    final result = testGenreModel.toEntity();
    expect(result, testGenre);
  });

  test('should be a Genre Map', () async {
    final result = testGenreModel.toJson();
    expect(result, testGenreMap);
  });

  test('should be from Genre Map', () async {
    final result = GenreModel.fromJson(testGenreMap);
    expect(result, testGenreModel);
  });
}
