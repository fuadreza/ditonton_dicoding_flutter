import 'package:core/services/base_api_client.dart';
import 'package:movie/data/datasources/db/database_helper.dart' as db_helper_movie;
import 'package:tvseries/data/datasources/db/database_helper.dart' as db_helper_tvseries;
import 'package:movie/data/datasources/movie_local_data_source.dart';
import 'package:movie/data/datasources/movie_remote_data_source.dart';
import 'package:movie/domain/repositories/movie_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:tvseries/data/datasources/tvseries_local_data_source.dart';
import 'package:tvseries/data/datasources/tvseries_remote_data_source.dart';
import 'package:tvseries/domain/repositories/tvseries_repository.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  TvSeriesRepository,
  TvSeriesRemoteDataSource,
  TvSeriesLocalDataSource,
  BaseApiClient,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
  MockSpec<db_helper_movie.DatabaseHelper>(as: #MockDatabaseHelperMovie),
  MockSpec<db_helper_tvseries.DatabaseHelper>(as: #MockDatabaseHelperTvSeries),
])
void main() {}
