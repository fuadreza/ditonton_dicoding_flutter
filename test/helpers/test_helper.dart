import 'package:ditonton_dicoding_flutter/common/services/base_api_client.dart';
import 'package:ditonton_dicoding_flutter/data/datasources/db/database_helper.dart';
import 'package:ditonton_dicoding_flutter/data/datasources/movie_local_data_source.dart';
import 'package:ditonton_dicoding_flutter/data/datasources/movie_remote_data_source.dart';
import 'package:ditonton_dicoding_flutter/data/datasources/tvseries_local_data_source.dart';
import 'package:ditonton_dicoding_flutter/data/datasources/tvseries_remote_data_source.dart';
import 'package:ditonton_dicoding_flutter/domain/repositories/movie_repository.dart';
import 'package:ditonton_dicoding_flutter/domain/repositories/tvseries_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  TvSeriesRepository,
  TvSeriesRemoteDataSource,
  TvSeriesLocalDataSource,
  BaseApiClient,
  DatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
