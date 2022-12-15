import 'package:dartz/dartz.dart';
import 'package:core/failure.dart';
import 'package:tvseries/domain/entities/tvseries.dart';
import 'package:tvseries/domain/repositories/tvseries_repository.dart';

class SearchTvSeries {
  final TvSeriesRepository repository;

  SearchTvSeries(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute(String query) {
    return repository.searchTvSeries(query);
  }
}
