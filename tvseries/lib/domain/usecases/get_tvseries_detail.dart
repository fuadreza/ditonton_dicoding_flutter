import 'package:dartz/dartz.dart';
import 'package:tvseries/domain/entities/tvseries_detail.dart';
import 'package:core/failure.dart';
import 'package:tvseries/domain/repositories/tvseries_repository.dart';

class GetTvSeriesDetail {
  final TvSeriesRepository repository;

  GetTvSeriesDetail(this.repository);

  Future<Either<Failure, TvSeriesDetail>> execute(int id) {
    return repository.getTvSeriesDetail(id);
  }
}
