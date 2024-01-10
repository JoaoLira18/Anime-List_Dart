import 'package:dio/dio.dart';
import 'package:anilist/constants/api.dart';
import 'package:anilist/models/random.dart';

import '../../models/anime.dart';

class HomeViewModel {
  static final _instance = HomeViewModel._internal();
  final Dio _dio = Dio();

  late Future<List<DataAnime>> _topMangas;
  late Future<DataAnime> _randomAnimeData;
  late Future<List<DataAnime>> _topAnimeData;
  late Future<List<DataAnime>> _seasonNowData;
  late Future<List<DataAnime>> _nextSeasonData;

  get topManga => _topMangas;
  get topAnime => _topAnimeData;
  get actualSeason => _seasonNowData;
  get randomAnime => _randomAnimeData;
  get upcomingAnime => _nextSeasonData;

  factory HomeViewModel() {
    return _instance;
  }

  HomeViewModel._internal();

  initViewModel() {
    _topMangas = getTopMangas();
    _topAnimeData = getTopAnimes();
    _seasonNowData = getSeasonNow();
    _randomAnimeData = getRandomAnime();
  }

  Future<List<DataAnime>> getTopAnimes() async {
    return request(Api.topAnime);
  }

  Future<List<DataAnime>> getTopMangas() async {
    return request(Api.topManga);
  }

  Future<List<DataAnime>> getSeasonNow() async {
    return request(Api.seasonNow);
  }

  Future<List<DataAnime>> getUpcomingAnimes() async {
    return request(Api.nextSeason);
  }

  Future<DataAnime> getRandomAnime() async {
    return requestRandom(Api.randomAnime);
  }

  Future<DataAnime> getRandomManga() async {
    return requestRandom(Api.randomManga);
  }

  Future<List<DataAnime>> request(path) async {
    late List<DataAnime> converted;
    try {
      var response = await _dio.get(path);
      if (response.statusCode == 200) {
        final dataJson = response.data as Map<String, dynamic>;
        final dataJsonConverted = Anime.fromJson(dataJson);
        converted = dataJsonConverted.data;
      } else {
        print(response.statusCode);
      }
    } catch (err) {
      print(err);
    }
    return converted;
  }

  Future<DataAnime> requestRandom(path) async {
    late DataAnime random;
    try {
      var response = await _dio.get(path);
      if (response.statusCode == 200) {
        final dataJson = response.data as Map<String, dynamic>;
        final dataJsonConverted = Random.fromJson(dataJson);
        random = dataJsonConverted.data;
      } else {
        print(response.statusCode);
      }
    } catch (err) {
      print(err);
    }
    return random;
  }
}
