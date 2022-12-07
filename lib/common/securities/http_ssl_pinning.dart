import 'package:ditonton_dicoding_flutter/common/services/custom_http_client.dart';
import 'package:http/http.dart' as http;

class HttpSSLPinning {
  static Future<http.Client> get _instance async => _clientInstance ??= await CustomHttpClient.createLEClient();
  static http.Client? _clientInstance;

  static http.Client get client => _clientInstance ?? http.Client();

  static Future<void> init() async {
    _clientInstance = await _instance;
  }
}
