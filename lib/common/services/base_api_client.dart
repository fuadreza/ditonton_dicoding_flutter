import 'package:ditonton_dicoding_flutter/common/exception.dart';
import 'package:http/http.dart' as http;

class BaseApiClient {
  final http.Client client;

  final baseUrl = 'https://api.themoviedb.org/3';
  final apiKey = '2174d146bb9c0eab47529b2e77d6b526';

  BaseApiClient({required this.client});

  Future<String> get({required String url, Map<String, dynamic>? params, String? path}) async {
    final Map<String, dynamic> newParam = {'api_key': apiKey};

    if (params != null) {
      newParam.addAll(params);
    }

    final uri = path == null ? Uri.https(baseUrl, url, params) : Uri.https(baseUrl, url + path, params);

    try {
      final response = await client.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }
}
