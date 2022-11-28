import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_flutter/data/datasources/tvseries_remote_data_source.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/tvseries.dart';
import 'package:ditonton_dicoding_flutter/common/exception.dart';
import 'package:ditonton_dicoding_flutter/common/failure.dart';
import 'package:ditonton_dicoding_flutter/domain/repositories/tvseries_repository.dart';

class TvSeriesRepositoryImpl implements TvSeriesRepository {
  final TvSeriesRemoteDataSource remoteDataSource;

  TvSeriesRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<TvSeries>>> getNowPlayingTvSeries() async {
    try {
      final result = await remoteDataSource.getNowPlayingTvSeries();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
