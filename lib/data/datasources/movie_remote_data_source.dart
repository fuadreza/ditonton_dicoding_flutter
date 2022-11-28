import 'dart:convert';

import 'package:ditonton_dicoding_flutter/common/services/base_api_client.dart';
import 'package:ditonton_dicoding_flutter/data/models/movie_detail_model.dart';
import 'package:ditonton_dicoding_flutter/data/models/movie_model.dart';
import 'package:ditonton_dicoding_flutter/data/models/movie_response.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailResponse> getMovieDetail(int id);

  Future<List<MovieModel>> getMovieRecommendations(int id);

  Future<List<MovieModel>> searchMovies(String query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  MovieRemoteDataSourceImpl({required this.client});

  final BaseApiClient client;

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await client.get(url: '/3/movie/now_playing');

    return MovieResponse.fromJson(json.decode(response)).movieList;
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(int id) async {
    final response = await client.get(url: '/3/movie/$id');

    return MovieDetailResponse.fromJson(json.decode(response));
  }

  @override
  Future<List<MovieModel>> getMovieRecommendations(int id) async {
    final response = await client.get(url: '/3/movie/$id/recommendations');

    return MovieResponse.fromJson(json.decode(response)).movieList;
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(url: '/3/movie/popular');

    return MovieResponse.fromJson(json.decode(response)).movieList;
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await client.get(url: '/3/movie/top_rated');

    return MovieResponse.fromJson(json.decode(response)).movieList;
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final params = {'query': query};
    final response = await client.get(url: '/3/search_movie/movie', params: params);

    return MovieResponse.fromJson(json.decode(response)).movieList;
  }
}
