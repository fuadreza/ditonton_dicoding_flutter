import 'package:movie/data/models/movie_model.dart';
import 'package:movie/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  const tMovieModel = MovieModel(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  test('should be same title', () async {
    final result = tMovieModel.toEntity().title;
    expect(result, tMovie.title);
  });

  test('should return genres', () async {
    final result = testMovieDetail.showGenres();
    expect(result, testMovieDetail.genres.first.name);
  });

  test('should return duration', () async {
    final result = testMovieDetail.showDuration();
    expect(result, '2h 0m');
  });
}
