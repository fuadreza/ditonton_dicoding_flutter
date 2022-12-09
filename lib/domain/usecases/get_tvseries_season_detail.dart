import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_flutter/common/failure.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/season_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/repositories/tvseries_repository.dart';

class GetTvSeriesSeasonDetail {
  final TvSeriesRepository repository;

  GetTvSeriesSeasonDetail(this.repository);

  Future<Either<Failure, SeasonDetail>> execute(int tvId, int seasonNumber) {
    return repository.getSeasons(tvId, seasonNumber);
  }
}
