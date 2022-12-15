import 'package:dartz/dartz.dart';
import 'package:core/failure.dart';
import 'package:tvseries/domain/entities/season_detail.dart';
import 'package:tvseries/domain/repositories/tvseries_repository.dart';

class GetTvSeriesSeasonDetail {
  final TvSeriesRepository repository;

  GetTvSeriesSeasonDetail(this.repository);

  Future<Either<Failure, SeasonDetail>> execute(int tvId, int seasonNumber) {
    return repository.getSeasons(tvId, seasonNumber);
  }
}
