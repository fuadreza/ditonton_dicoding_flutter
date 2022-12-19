import 'package:tvseries/data/models/episode_model.dart';
import 'package:tvseries/data/models/genre_model.dart';
import 'package:tvseries/data/models/season_detail_model.dart';
import 'package:tvseries/data/models/season_model.dart';
import 'package:tvseries/data/models/tvseries_detail_model.dart';
import 'package:tvseries/data/models/tvseries_model.dart';
import 'package:tvseries/data/models/tvseries_table.dart';
import 'package:tvseries/domain/entities/episode.dart';
import 'package:tvseries/domain/entities/genre.dart';
import 'package:tvseries/domain/entities/season.dart';
import 'package:tvseries/domain/entities/season_detail.dart';
import 'package:tvseries/domain/entities/tvseries.dart';
import 'package:tvseries/domain/entities/tvseries_detail.dart';

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
  genres: [testGenre],
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

const testTvSeriesDetailModel = TvSeriesDetailModel(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [testGenreModel],
  id: 1,
  originalName: 'originalName',
  overview: 'overview',
  posterPath: 'posterPath',
  firstAirDate: 'releaseDate',
  voteAverage: 1,
  voteCount: 1,
  name: 'name',
  seasons: [],
  homepage: '',
  lastAirDate: '',
  numberOfEpisodes: 1,
  numberOfSeasons: 1,
  originalLanguage: '',
  popularity: 100,
  status: '',
  tagline: '',
  type: '',
);

const testTvSeriesDetailModelMap = {
  'adult': false,
  'backdrop_path': 'backdropPath',
  'genres': [testGenreMap],
  'id': 1,
  'original_name': 'originalName',
  'overview': 'overview',
  'poster_path': 'posterPath',
  'first_air_date': 'releaseDate',
  'vote_average': 1,
  'vote_count': 1,
  'name': 'name',
  'seasons': [],
  'homepage': '',
  'last_air_date': '',
  'number_of_episodes': 1,
  'number_of_seasons': 1,
  'original_language': '',
  'popularity': 100,
  'status': '',
  'tagline': '',
  'type': '',
};

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

const testTvSeriesModel = TvSeriesModel(
  backdropPath: '/path.jpg',
  firstAirDate: '22',
  genreIds: [1, 2, 3],
  id: 1,
  name: 'name',
  originCountry: ['en'],
  originalLanguage: 'en',
  originalName: 'name origin',
  overview: 'overview',
  popularity: 1000,
  posterPath: '/path.jpg',
  voteAverage: 100.1,
  voteCount: 100,
);

const testTvSeriesModelMap = {
  'backdrop_path': '/path.jpg',
  'first_air_date': '22',
  'genre_ids': [1, 2, 3],
  'id': 1,
  'name': 'name',
  'origin_country': ['en'],
  'original_language': 'en',
  'original_name': 'name origin',
  'overview': 'overview',
  'popularity': 1000,
  'poster_path': '/path.jpg',
  'vote_average': 100.1,
  'vote_count': 100,
};

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

const testSeasonModelMap = {
  'id': 171559,
  'name': 'Season 1',
  'poster_path': '/sB2DASpJtfnTs7iK3RqkUMFVDEa.jpg',
  'season_number': 1,
};

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
  episodes: [
    testEpisodeModel,
  ],
);

const testSeasonDetail = SeasonDetail(
  airDate: '',
  episodeCount: 1,
  id: 171559,
  name: 'Season 1',
  posterPath: '/sB2DASpJtfnTs7iK3RqkUMFVDEa.jpg',
  seasonNumber: 1,
  episodes: [
    testEpisode,
  ],
);

const testSeasonDetailMap = {
  'air_date': '',
  'episode_count': 1,
  'id': 171559,
  'name': 'Season 1',
  'poster_path': '/sB2DASpJtfnTs7iK3RqkUMFVDEa.jpg',
  'season_number': 1,
  'episodes': [testEpisodeMap],
};

const testSeasonDetailMapList = [
  {
    'air_date': '',
    'episode_count': 1,
    'id': 171559,
    'name': 'Season 1',
    'poster_path': '/sB2DASpJtfnTs7iK3RqkUMFVDEa.jpg',
    'season_number': 1,
    'episodes': [testEpisodeMap],
  }
];

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

const testEpisodeMap = {
  'air_date': '10-10-2020',
  'episode_number': 1,
  'id': 1,
  'name': 'Episode',
  'overview': 'overview',
  'runtime': 1,
  'season_number': 1,
  'vote_average': 1.0,
  'vote_count': 10,
};

//#endregion EPISODE

//#region GENRE

const testGenreModel = GenreModel(id: 1, name: 'Genre A');

const testGenre = Genre(id: 1, name: 'Genre A');

const testGenreMap = {'id': 1, 'name': 'Genre A'};

//#endregion GENRE
