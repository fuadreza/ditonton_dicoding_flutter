import 'package:ditonton_dicoding_flutter/common/enums/list_direction.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/widgets/lists/popular_movies_list.dart';
import 'package:flutter/material.dart';

class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: PopularMovieList(
          listDirection: ListDirection.vertical,
        ),
      ),
    );
  }
}

//
// class PopularMoviesPage extends StatefulWidget {
//   static const ROUTE_NAME = '/popular-movie';
//
//   @override
//   _PopularMoviesPageState createState() => _PopularMoviesPageState();
// }
//
// class _PopularMoviesPageState extends State<PopularMoviesPage> {
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() =>
//         Provider.of<PopularMoviesNotifier>(context, listen: false)
//             .fetchPopularMovies());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Popular Movies'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Consumer<PopularMoviesNotifier>(
//           builder: (context, data, child) {
//             if (data.state == RequestState.Loading) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (data.state == RequestState.Loaded) {
//               return ListView.builder(
//                 itemBuilder: (context, index) {
//                   final movie = data.movies[index];
//                   return MovieCard(movie);
//                 },
//                 itemCount: data.movies.length,
//               );
//             } else {
//               return Center(
//                 key: Key('error_message'),
//                 child: Text(data.message),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
