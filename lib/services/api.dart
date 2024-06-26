import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:netflix_clone__/common/constant.dart';
import 'package:netflix_clone__/common/utils.dart';
import 'package:netflix_clone__/models/movie.dart';
import 'package:netflix_clone__/models/movie_recomention.dart';
import 'package:netflix_clone__/models/search_model.dart';

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _topRateUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';

  static const _upComingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  static const _yourNextwatch =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';

  // for search

  static const baseUrl = "https://api.themoviedb.org/3/";
  var key = "?api_key=$apiKey";
  late String endPoint;

  Future<List<Movie>> gettrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something happend');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRateUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      print(decodeData);
      List<Movie> movie =
          decodeData.map((movie) => Movie.fromJson(movie)).toList();
      movie.shuffle(Random());
      return movie;
    } else {
      throw Exception('something happend');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upComingUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something happend');
    }
  }

  // search

  Future<SearchModel> getSearchMovies(String searchText) async {
    endPoint = "search/tv?query=$searchText";
    final url = "$baseUrl$endPoint";
    print("search url is $url");
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization':
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NTAyYjhjMDMxYzc5NzkwZmU1YzBiNGY5NGZkNzcwZCIsInN1YiI6IjYzMmMxYjAyYmE0ODAyMDA4MTcyNjM5NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N1SoB26LWgsA33c-5X0DT5haVOD4CfWfRhwpDu9eGkc"
      });
      switch (response.statusCode) {
        case 200:
          print("Response Status: ${response.statusCode}");
          return SearchModel.fromJson(jsonDecode(response.body));
        case 400:
          print("Bad Request: ${response.statusCode} ${response.reasonPhrase}");
          throw Exception("Bad Request: Failed to load movies");
        case 401:
          print(
              "Unauthorized: ${response.statusCode} ${response.reasonPhrase}");
          throw Exception("Unauthorized: Failed to load movies");
        case 404:
          print("Not Found: ${response.statusCode} ${response.reasonPhrase}");
          throw Exception("Not Found: Failed to load movies");
        case 500:
          print(
              "Internal Server Error: ${response.statusCode} ${response.reasonPhrase}");
          throw Exception("Internal Server Error: Failed to load movies");
        default:
          print("Error: ${response.statusCode} ${response.reasonPhrase}");
          throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Exception caught: $e");
      throw Exception("Failed to load movies");
    }
  }

// Get popular movies

  Future<MovieRecomentation> getPopularMovies() async {
    try {
      final response = await http.get(Uri.parse(_yourNextwatch));

      switch (response.statusCode) {
        case 200:
          print("Response Status: ${response.statusCode}");
          return MovieRecomentation.fromJson(jsonDecode(response.body));
        case 400:
          print("Bad Request: ${response.statusCode} ${response.reasonPhrase}");
          throw Exception("Bad Request: Failed to load movies");
        case 401:
          print(
              "Unauthorized: ${response.statusCode} ${response.reasonPhrase}");
          throw Exception("Unauthorized: Failed to load movies");
        case 404:
          print("Not Found: ${response.statusCode} ${response.reasonPhrase}");
          throw Exception("Not Found: Failed to load movies");
        case 500:
          print(
              "Internal Server Error: ${response.statusCode} ${response.reasonPhrase}");
          throw Exception("Internal Server Error: Failed to load movies");
        default:
          print("Error: ${response.statusCode} ${response.reasonPhrase}");
          throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Exception caught: $e");
      throw Exception("Failed to load movies");
    }
  }
// your next watche

  Future<List<Movie>> getNextWatch() async {
    final response = await http.get(Uri.parse(_yourNextwatch));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something happend');
    }
  }

  Future<List<Movie>> getNewOn() async {
    final response = await http.get(Uri.parse(_upComingUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      print(decodeData);
      List<Movie> movie =
          decodeData.map((movie) => Movie.fromJson(movie)).toList();
      movie.shuffle(Random());
      return movie;
    } else {
      throw Exception('something happend');
    }
  }

  Future<MovieRecomentation> getgames() async {
    try {
      final response = await http.get(Uri.parse(_yourNextwatch));

      switch (response.statusCode) {
        case 200:
          print("Response Status: ${response.statusCode}");
          return MovieRecomentation.fromJson(jsonDecode(response.body));
        case 400:
          print("Bad Request: ${response.statusCode} ${response.reasonPhrase}");
          throw Exception("Bad Request: Failed to load movies");
        case 401:
          print(
              "Unauthorized: ${response.statusCode} ${response.reasonPhrase}");
          throw Exception("Unauthorized: Failed to load movies");
        case 404:
          print("Not Found: ${response.statusCode} ${response.reasonPhrase}");
          throw Exception("Not Found: Failed to load movies");
        case 500:
          print(
              "Internal Server Error: ${response.statusCode} ${response.reasonPhrase}");
          throw Exception("Internal Server Error: Failed to load movies");
        default:
          print("Error: ${response.statusCode} ${response.reasonPhrase}");
          throw Exception("Failed to load movies");
      }
    } catch (e) {
      print("Exception caught: $e");
      throw Exception("Failed to load movies");
    }
  }
}
