import 'package:core/constants.dart';
import 'package:core/securities/http_ssl_pinning.dart';
import 'package:core/utils.dart';
import 'package:ditonton_dicoding_flutter/firebase_options.dart';
import 'package:core/injection.dart' as core_injection;
import 'package:tvseries/injection.dart' as tvseries_injection;
import 'package:movie/injection.dart' as movie_injection;
import 'package:ditonton_dicoding_flutter/presentation/pages/home/home_page.dart';
import 'package:ditonton_dicoding_flutter/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HttpSSLPinning.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  core_injection.init();
  tvseries_injection.init();
  movie_injection.init();
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
