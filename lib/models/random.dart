import 'anime.dart';

class Random {
  Random({
    required this.data,
  });
  late final DataAnime data;

  Random.fromJson(Map<String, dynamic> json) {
    data = DataAnime.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}
