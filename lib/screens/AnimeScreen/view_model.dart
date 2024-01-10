import 'package:dio/dio.dart';
import 'package:anilist/constants/api.dart';

import '../../models/index.dart';

class AnimeViewModel {
  static final _instance = AnimeViewModel._internal();
  final Dio _dio = Dio();

  late Future<List<DataNews>> _news;
  late Future<List<DataReviews>> _reviews;
  late Future<List<DataRecommendation>> _recommendation;

  get news => _news;
  get reviews => _reviews;
  get recommendation => _recommendation;

  factory AnimeViewModel() {
    return _instance;
  }

  AnimeViewModel._internal();

  Future<List<DataNews>> getAnimeNews(id) {
    _news = requestNews("${Api.baseURL}/anime/$id/news");
    return _news;
  }

  Future<List<DataReviews>> getAnimeReviews(id) async {
    _reviews = requestReviews("${Api.baseURL}/anime/$id/reviews");
    return _reviews;
  }

  Future<List<DataRecommendation>> getRecommendation(id) async {
    _recommendation =
        requestRecommendation("${Api.baseURL}/anime/$id/recommendations");
    return _recommendation;
  }

  Future<List<DataNews>> requestNews(path) async {
    late List<DataNews> converted;
    try {
      var response = await _dio.get(path);
      if (response.statusCode == 200) {
        final dataJson = response.data as Map<String, dynamic>;
        final dataJsonConverted = News.fromJson(dataJson);
        converted = dataJsonConverted.data;
      } else {
        print(response.statusCode);
      }
    } catch (err) {
      converted = [];
      print(err);
    }
    return converted;
  }

  Future<List<DataRecommendation>> requestRecommendation(path) async {
    late List<DataRecommendation> converted;
    try {
      var response = await _dio.get(path);
      if (response.statusCode == 200) {
        final dataJson = response.data as Map<String, dynamic>;
        final dataJsonConverted = Recommendation.fromJson(dataJson);
        converted = dataJsonConverted.data;
      } else {
        print(response.statusCode);
      }
    } catch (err) {
      converted = [];
      print(err);
    }
    return converted;
  }

  Future<List<DataReviews>> requestReviews(path) async {
    late List<DataReviews> converted;
    try {
      var response = await _dio.get(path);
      if (response.statusCode == 200) {
        final dataJson = response.data as Map<String, dynamic>;
        final dataJsonConverted = Reviews.fromJson(dataJson);
        converted = dataJsonConverted.data;
      } else {
        print(response.statusCode);
      }
    } catch (err) {
      converted = [];
      print(err);
    }
    return converted;
  }
}
