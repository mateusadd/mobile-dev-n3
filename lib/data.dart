import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models.dart';

class DataService {
  Future<Movie> getMovies(String movieName) async {
    final response = await http.get(
        'https://api.themoviedb.org/3/search/movie?api_key=aed290d0b9e9740f99746c0bf2f05d80&query=' +
            movieName);

    print(response.body);

    final json = jsonDecode(response.body);
    return Movie.fromJson(json);
  }
}
