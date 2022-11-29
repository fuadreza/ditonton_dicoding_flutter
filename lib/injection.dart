import 'package:ditonton_dicoding_flutter/common/services/base_api_client.dart';
import 'package:ditonton_dicoding_flutter/data/datasources/db/database_helper.dart';
import 'package:ditonton_dicoding_flutter/data/datasources/movie_local_data_source.dart';
import 'package:ditonton_dicoding_flutter/data/datasources/movie_remote_data_source.dart';
import 'package:ditonton_dicoding_flutter/data/datasources/tvseries_local_data_source.dart';
import 'package:ditonton_dicoding_flutter/data/datasources/tvseries_remote_data_source.dart';
import 'package:ditonton_dicoding_flutter/data/repositories/movie_repository_impl.dart';
import 'package:ditonton_dicoding_flutter/data/repositories/tvseries_repository_impl.dart';
import 'package:ditonton_dicoding_flutter/domain/repositories/movie_repository.dart';
import 'package:ditonton_dicoding_flutter/domain/repositories/tvseries_repository.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_movie_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_now_playing_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_popular_movies.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_popular_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_top_rated_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_tvseries_detail.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_status_movie.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_status_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/get_watchlist_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/remove_watchlist_movie.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/remove_watchlist_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/save_watchlist_movie.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/save_watchlist_tvseries.dart';
import 'package:ditonton_dicoding_flutter/domain/usecases/search_movies.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/blocs/now_playing/now_playing_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/blocs/popular/popular_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/blocs/top_rated/top_rated_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/now_playing/now_playing_tvseries_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/popular/popular_tvseries_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/top_rated/top_rated_tvseries_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/movie_detail/blocs/detail/movie_detail_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/movie_detail/blocs/recommendation/movie_recommendation_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/search_movie/blocs/search_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/blocs/detail/tvseries_detail_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/watchlist_movies/blocs/watchlist_movies_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/watchlist_tvseries/blocs/watchlist_tvseries_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  //#region BLOC
  locator.registerFactory(
    () => NowPlayingMovieBloc(
      getNowPlayingMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMovieBloc(
      getPopularMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMovieBloc(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailBloc(
      getMovieDetail: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieRecommendationBloc(
      getMovieRecommendations: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchListMoviesBloc(
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => SearchMovieBloc(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => NowPlayingTvSeriesBloc(
      getNowPlayingTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularTvSeriesBloc(
      getPopularTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedTvSeriesBloc(
      getTopRatedTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesDetailBloc(
      getTvSeriesDetail: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchListTvSeriesBloc(
      getWatchlistTvSeries: locator(),
    ),
  );
  //#endregion BLOC

  //#region USE CASES
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetNowPlayingTvSeries(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetPopularTvSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvSeries(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetTvSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusMovie(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusTvSeries(locator()));
  locator.registerLazySingleton(() => SaveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvSeries(locator()));
  //#endregion USE CASES

  //#region REPOSITORIES
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TvSeriesRepository>(
    () => TvSeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  //#endregion REPOSITORIES

  //#region DATA SOURCES
  locator.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(
      client: locator(),
    ),
  );
  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
    () => TvSeriesRemoteDataSourceImpl(
      client: locator(),
    ),
  );
  locator.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(
      databaseHelper: locator(),
    ),
  );
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
    () => TvSeriesLocalDataSourceImpl(
      databaseHelper: locator(),
    ),
  );
  //#endregion DATA SOURCES

  //#region HELPER
  locator.registerLazySingleton<DatabaseHelper>(
    () => DatabaseHelper(),
  );
  locator.registerLazySingleton<BaseApiClient>(
    () => BaseApiClient(
      client: locator(),
    ),
  );
  //#endregion HELPER

  //#region EXTERNAL
  locator.registerLazySingleton(
    () => http.Client(),
  );
  //#endregion EXTERNAL
}
