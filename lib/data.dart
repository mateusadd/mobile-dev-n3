import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models.dart';

class DataService {
  Future<Movie> getMovies(String movieName) async {
    print(movieName);

    final queryParameters = {
      'api_key': 'aed290d0b9e9740f99746c0bf2f05d80',
      'query': movieName
    };

    print(queryParameters);

    final uri =
        Uri.https('api.themoviedb.org', '/search/movie/', queryParameters);

    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    return Movie.fromJson(json);
  }
}
