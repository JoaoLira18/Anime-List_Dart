import 'anime.dart';
import 'general/index.dart';

class Manga {
  Manga({
    required this.data,
    required this.pagination,
  });
  late final List<Anime> data;
  late final Pagination pagination;

  Manga.fromJson(Map<String, dynamic> json) {
    pagination = Pagination.fromJson(json['pagination']);
    data = List.from(json['data']).map((e) => Anime.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pagination'] = pagination.toJson();
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}
