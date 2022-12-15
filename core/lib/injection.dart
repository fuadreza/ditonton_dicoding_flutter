import 'package:core/securities/http_ssl_pinning.dart';
import 'package:core/services/base_api_client.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {

  //#region HELPER
  locator.registerLazySingleton<BaseApiClient>(
    () => BaseApiClient(
      client: locator(),
    ),
  );
  //#endregion HELPER

  //#region EXTERNAL
  locator.registerLazySingleton(
    () => HttpSSLPinning.client,
  );
  //#endregion EXTERNAL
}
