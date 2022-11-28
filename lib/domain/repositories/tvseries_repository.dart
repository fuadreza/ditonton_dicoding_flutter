import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_flutter/common/failure.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/tvseries.dart';

abstract class TvSeriesRepository {
  Future<Either<Failure, List<TvSeries>>> getNowPlayingTvSeries();
}
