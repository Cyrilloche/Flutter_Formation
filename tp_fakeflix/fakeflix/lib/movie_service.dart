import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fakeflix/movie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String? apiToken = dotenv.env['API_TOKEN'];

final dio = Dio(
  BaseOptions(
    baseUrl: "https://api.themoviedb.org/3",
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 5000),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apiToken",
    },
  ),
);

class MovieService {
  static Future<List<Movie>?> readMovies() async {
    try {
      const String urlBase =
          "/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc";
      final response = await dio.get(urlBase);

      if (response.statusCode == 200) {
        List<Movie> movies = [];

        for (var movie in response.data['results']) {
          //movies.add(Movie.fromJson(movie));
          movies.add(Movie.fromJson((response.data) as Map<String, dynamic>));
        }
        return movies;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
