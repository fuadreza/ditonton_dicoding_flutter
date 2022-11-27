import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/movie_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/repositories/movie_repository.dart';
import 'package:ditonton_dicoding_flutter/common/failure.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, MovieDetail>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}