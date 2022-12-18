import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/domain/usecases/get_tvseries_season_detail.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvSeriesSeasonDetail usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetTvSeriesSeasonDetail(mockTvSeriesRepository);
  });

  test('should get tv series season from the repository', () async {
    // arrange
    when(mockTvSeriesRepository.getSeasons(testSeason.id, testSeason.seasonNumber))
        .thenAnswer((_) async => const Right(testSeasonDetail));
    // act
    final result = await usecase.execute(testSeason.id, testSeason.seasonNumber);
    // assert
    expect(result, const Right(testSeasonDetail));
  });
}
