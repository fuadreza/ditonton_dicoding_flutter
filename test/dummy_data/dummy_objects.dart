import 'package:ditonton_dicoding_flutter/data/models/episode_model.dart';
import 'package:ditonton_dicoding_flutter/data/models/genre_model.dart';
import 'package:ditonton_dicoding_flutter/data/models/movie_table.dart';
import 'package:ditonton_dicoding_flutter/data/models/season_detail_model.dart';
import 'package:ditonton_dicoding_flutter/data/models/season_model.dart';
import 'package:ditonton_dicoding_flutter/data/models/tvseries_table.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/episode.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/genre.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/movie.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/movie_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/season.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/season_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/entities/tvseries_detail.dart';

//#region MOVIE

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: const [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview: 'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

const testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

const testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

//#endregion MOVIE

//#region TV SERIES

final testTvSeries = TvSeries(
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  id: 557,
  originalName: 'Spider-Man',
  overview: 'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
);

final testTvSeriesList = [testTvSeries];

const testTvSeriesDetail = TvSeriesDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalName: 'originalName',
  overview: 'overview',
  posterPath: 'posterPath',
  firstAirDate: 'releaseDate',
  voteAverage: 1,
  voteCount: 1,
  name: 'name',
  seasons: [],
);

final testWatchlistTvSeries = TvSeries.watchlist(
  id: 1,
  originalName: 'originalName',
  posterPath: 'posterPath',
  overview: 'overview',
);

const testTvSeriesTable = TvSeriesTable(
  id: 1,
  originalName: 'originalName',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvSeriesMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'originalName': 'originalName',
};

//#endregion TV SERIES

//#region SEASON

const testSeasonModel = SeasonModel(
  id: 171559,
  name: 'Season 1',
  posterPath: '/sB2DASpJtfnTs7iK3RqkUMFVDEa.jpg',
  seasonNumber: 1,
);

const testSeason = Season(
  id: 171559,
  name: 'Season 1',
  posterPath: '/sB2DASpJtfnTs7iK3RqkUMFVDEa.jpg',
  seasonNumber: 1,
);

const testSeasonDetailModel = SeasonDetailModel(
  airDate: '',
  episodeCount: 1,
  id: 171559,
  name: 'Season 1',
  posterPath: '/sB2DASpJtfnTs7iK3RqkUMFVDEa.jpg',
  seasonNumber: 1,
  episodes: [],
);

const testSeasonDetail = SeasonDetail(
  airDate: '',
  episodeCount: 1,
  id: 171559,
  name: 'Season 1',
  posterPath: '/sB2DASpJtfnTs7iK3RqkUMFVDEa.jpg',
  seasonNumber: 1,
  episodes: [],
);

//#endregion SEASON

//#region EPISODE

const testEpisodeModel = EpisodesModel(
  airDate: '10-10-2020',
  episodeNumber: 1,
  id: 1,
  name: 'Episode',
  overview: 'overview',
  runtime: 1,
  seasonNumber: 1,
  voteAverage: 1.0,
  voteCount: 10,
);

const testEpisode = Episode(
  airDate: '10-10-2020',
  episodeNumber: 1,
  id: 1,
  name: 'Episode',
  overview: 'overview',
  runtime: 1,
  seasonNumber: 1,
  voteAverage: 1.0,
  voteCount: 10,
);

//#endregion EPISODE


//#region GENRE

const testGenreModel = GenreModel(id: 1, name: 'Genre A');

const testGenre = Genre(id: 1, name: 'Genre A');

//#endregion GENRE