import 'package:flutter/material.dart';
import 'package:movie_list/widgets/toprated.dart';
import 'package:movie_list/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'data.dart';
import 'models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List trendingMovies = [];
  List topRatedMovies = [];
  final String apiKey = 'aed290d0b9e9740f99746c0bf2f05d80';
  final acessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZWQyOTBkMGI5ZTk3NDBmOTk3NDZjMGJmMmYwNWQ4MCIsInN1YiI6IjYxYTAyOTg4N2VjZDI4MDAyODJhZTdiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Bp8-J0MnBr_8bfJwmuxoL_uIRsg5LVswloN8aUdfkQo';
  final _movieController = TextEditingController();
  final _dataService = DataService();

  Movie _response;

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbCustomLogs = TMDB(ApiKeys(apiKey, acessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResult = await tmdbCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbCustomLogs.v3.movies.getTopRated();

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
    });
    print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            TextField(
              controller: _movieController,
            ),
            ElevatedButton.icon(
              onPressed: _search,
              icon: Icon(Icons.search),
              label: Text(''),
            ),
            if (_response != null)
              Container(
                child: Column(
                  children: [
                    Image.network(
                        'https://image.tmdb.org/t/p/w500' + _response.banner),
                    Text(_response.title),
                  ],
                ),
              ),
            /*ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
              icon: Icon(Icons.search),
              label: Text(''),
            ),*/
            TopRated(
              toprated: topRatedMovies,
            ),
            TrendingMovies(trending: trendingMovies)
          ],
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getMovies(_movieController.text);
    setState(() => _response = response);
  }
}
