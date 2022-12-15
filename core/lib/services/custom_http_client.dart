import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:http/io_client.dart';

class CustomHttpClient {
  static Future<HttpClient> customHttpClient({
    bool isTestMode = false,
  }) async {
    SecurityContext context = SecurityContext(withTrustedRoots: false);
    try {
      List<int> bytes = [];
      bytes = (await rootBundle.load('certificates/certificates.pem')).buffer.asUint8List();
      context.setTrustedCertificatesBytes(bytes);
    } on TlsException catch (e, s) {
      if (!kReleaseMode) {
        log('ERROR >> TLS EXCEPTION $e | STACK $s');
      }
      log('ERROR >> TLS EXCEPTION $e | STACK $s');
      rethrow;
    } catch (e, s) {
      log('ERROR >> ERROR $e | STACK $s');
      rethrow;
    }
    HttpClient httpClient = HttpClient(context: context);
    httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => false;

    return httpClient;
  }

  static Future<http.Client> createLEClient({bool isTestMode = false}) async {
    IOClient client = IOClient(await CustomHttpClient.customHttpClient(isTestMode: isTestMode));
    return client;
  }
}
