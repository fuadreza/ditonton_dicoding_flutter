import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/movie.dart';
import 'package:ditonton_dicoding_flutter/domain/repositories/movie_repository.dart';
import 'package:ditonton_dicoding_flutter/common/failure.dart';

class GetMovieRecommendations {
  final MovieRepository repository;

  GetMovieRecommendations(this.repository);

  Future<Either<Failure, List<Movie>>> execute(id) {
    return repository.getMovieRecommendations(id);
  }
}
