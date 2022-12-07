import 'package:ditonton_dicoding_flutter/common/constants.dart';
import 'package:ditonton_dicoding_flutter/common/securities/http_ssl_pinning.dart';
import 'package:ditonton_dicoding_flutter/common/utils.dart';
import 'package:ditonton_dicoding_flutter/injection.dart' as di;
import 'package:ditonton_dicoding_flutter/presentation/pages/home/home_page.dart';
import 'package:ditonton_dicoding_flutter/routes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HttpSSLPinning.init();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ditonton',
      theme: ThemeData.dark().copyWith(
        colorScheme: kColorScheme,
        primaryColor: kRichBlack,
        scaffoldBackgroundColor: kRichBlack,
        textTheme: kTextTheme,
      ),
      home: const HomePage(),
      navigatorObservers: [routeObserver],
      onGenerateRoute: AppNavigator.onGenerateRoute,
    );
  }
}
