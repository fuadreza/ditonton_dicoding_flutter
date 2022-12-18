import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/data/datasources/db/database_helper.dart';
import 'package:movie/injection.dart' as injection;

void main() {
  test('should be a GetIt Instance', () async {
    final result = injection.locator;
    expect(result, GetIt.instance);
  });

  test('should return database', () async {
    injection.init();
    expect(injection.locator<DatabaseHelper>(), DatabaseHelper());
  });
}
