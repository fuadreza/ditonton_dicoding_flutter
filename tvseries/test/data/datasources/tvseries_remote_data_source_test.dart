import 'dart:convert';

import 'package:core/services/base_api_client.dart';
import 'package:tvseries/data/datasources/tvseries_remote_data_source.dart';
import 'package:core/exception.dart';
import 'package:tvseries/data/models/tvseries_detail_model.dart';
import 'package:tvseries/data/models/tvseries_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  const apiKey = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const baseUrl = 'https://api.themoviedb.org/3';

  late TvSeriesRemoteDataSourceImpl dataSource;
  late BaseApiClient baseApiClient;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    baseApiClient = BaseApiClient(client: mockHttpClient);
    dataSource = TvSeriesRemoteDataSourceImpl(client: baseApiClient);
  });

  group('get Now Playing TvSeries', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(json.decode(readJson('dummy_data/now_playing_tvseries.json'))).tvSeriesList;

    test('should return list of TvSeries Model when the response code is 200', () async {
      // arrange
      final jsonResponse = readJson('dummy_data/now_playing_tvseries.json');
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey'), headers: {'Content-Type': 'application/json'})).thenAnswer((_) async => http.Response(jsonResponse, 200));
      // act
      final result = await dataSource.getNowPlayingTvSeries();
      // assert
      expect(result, equals(tTvSeriesList));
    });

    test('should throw a ServerException when the response code is 404 or other', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey'), headers: {'Content-Type': 'application/json'})).thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getNowPlayingTvSeries();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Popular TvSeries', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(json.decode(readJson('dummy_data/popular_tvseries.json'))).tvSeriesList;

    test('should return list of tv series when response is success (200)', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/popular?$apiKey'), headers: {'Content-Type': 'application/json'})).thenAnswer((_) async => http.Response(readJson('dummy_data/popular_tvseries.json'), 200));
      // act
      final result = await dataSource.getPopularTvSeries();
      // assert
      expect(result, tTvSeriesList);
    });

    test('should throw a ServerException when the response code is 404 or other', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/popular?$apiKey'), headers: {'Content-Type': 'application/json'})).thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getPopularTvSeries();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Top Rated TvSeries', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(json.decode(readJson('dummy_data/top_rated_tvseries.json'))).tvSeriesList;

    test('should return list of tv series when response code is 200 ', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey'), headers: {'Content-Type': 'application/json'})).thenAnswer((_) async => http.Response(readJson('dummy_data/top_rated_tvseries.json'), 200));
      // act
      final result = await dataSource.getTopRatedTvSeries();
      // assert
      expect(result, tTvSeriesList);
    });

    test('should throw ServerException when response code is other than 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey'), headers: {'Content-Type': 'application/json'})).thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTopRatedTvSeries();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get tv series detail', () {
    const tId = 119051;
    final tTvSeriesDetail = TvSeriesDetailModel.fromJson(json.decode(readJson('dummy_data/tvseries_detail.json')));

    test('should return tv series detail when the response code is 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/$tId?$apiKey'), headers: {'Content-Type': 'application/json'})).thenAnswer((_) async => http.Response(readJson('dummy_data/tvseries_detail.json'), 200));
      // act
      final result = await dataSource.getTvSeriesDetail(tId);
      // assert
      expect(result, equals(tTvSeriesDetail));
    });

    test('should throw Server Exception when the response code is 404 or other', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/$tId?$apiKey'), headers: {'Content-Type': 'application/json'})).thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTvSeriesDetail(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get tv series recommendations', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(json.decode(readJson('dummy_data/tvseries_recommendations.json'))).tvSeriesList;
    const tId = 119051;

    test('should return list of TvSeries Model when the response code is 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/$tId/recommendations?$apiKey'), headers: {'Content-Type': 'application/json'})).thenAnswer((_) async => http.Response(readJson('dummy_data/tvseries_recommendations.json'), 200));
      // act
      final result = await dataSource.getTvSeriesRecommendations(tId);
      // assert
      expect(result, equals(tTvSeriesList));
    });

    test('should throw Server Exception when the response code is 404 or other', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/$tId/recommendations?$apiKey'), headers: {'Content-Type': 'application/json'})).thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTvSeriesRecommendations(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('search tvseries', () {
    final tSearchResult = TvSeriesResponse.fromJson(json.decode(readJson('dummy_data/search_black_tvseries.json'))).tvSeriesList;
    const tQuery = 'black';

    test('should return list of tv series when response code is 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$tQuery'), headers: {'Content-Type': 'application/json'})).thenAnswer((_) async => http.Response(readJson('dummy_data/search_black_tvseries.json'), 200));
      // act
      final result = await dataSource.searchTvSeries(tQuery);
      // assert
      expect(result, tSearchResult);
    });

    test('should throw ServerException when response code is other than 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$tQuery'), headers: {'Content-Type': 'application/json'})).thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.searchTvSeries(tQuery);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
