import 'package:flutter/material.dart';
import 'package:movie_list/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  final String apiKey = 'aed290d0b9e9740f99746c0bf2f05d80';
  final acessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZWQyOTBkMGI5ZTk3NDBmOTk3NDZjMGJmMmYwNWQ4MCIsInN1YiI6IjYxYTAyOTg4N2VjZDI4MDAyODJhZTdiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Bp8-J0MnBr_8bfJwmuxoL_uIRsg5LVswloN8aUdfkQo';

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
        appBar: AppBar(
          title: Text("Movies List"),
        ),
        body: ListView(
          children: [TrendingMovies(trending: trendingMovies)],
        ),
      ),
    );
  }
}
