import 'package:ditonton_dicoding_flutter/common/constants.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/about/about_page.dart';
import 'package:flutter/material.dart';

class HomeMoviePage extends StatelessWidget {
  const HomeMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Movies'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist'),
              onTap: () {
                // Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.routeName);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Now Playing',
                style: kHeading6,
              ),
              // Consumer<MovieListNotifier>(builder: (context, data, child) {
              //   final state = data.nowPlayingState;
              //   if (state == RequestState.Loading) {
              //     return const Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   } else if (state == RequestState.Loaded) {
              //     return MovieList(data.nowPlayingMovies);
              //   } else {
              //     return const Text('Failed');
              //   }
              // }),
              // _buildSubHeading(
              //   title: 'Popular',
              //   onTap: () =>
              //       Navigator.pushNamed(context, PopularMoviesPage.ROUTE_NAME),
              // ),
              // Consumer<MovieListNotifier>(builder: (context, data, child) {
              //   final state = data.popularMoviesState;
              //   if (state == RequestState.Loading) {
              //     return const Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   } else if (state == RequestState.Loaded) {
              //     return MovieList(data.popularMovies);
              //   } else {
              //     return const Text('Failed');
              //   }
              // }),
              // _buildSubHeading(
              //   title: 'Top Rated',
              //   onTap: () =>
              //       Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
              // ),
              // Consumer<MovieListNotifier>(builder: (context, data, child) {
              //   final state = data.topRatedMoviesState;
              //   if (state == RequestState.Loading) {
              //     return const Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   } else if (state == RequestState.Loaded) {
              //     return MovieList(data.topRatedMovies);
              //   } else {
              //     return const Text('Failed');
              //   }
              // }),
            ],
          ),
        ),
      ),
    );
  }

  // Row _buildSubHeading({required String title, required Function() onTap}) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Text(
  //         title,
  //         style: kHeading6,
  //       ),
  //       InkWell(
  //         onTap: onTap,
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Row(
  //             children: const [Text('See More'), Icon(Icons.arrow_forward_ios)],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}


