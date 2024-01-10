import 'general/images.dart';

class Recommendation {
  Recommendation({
    required this.data,
  });
  late final List<DataRecommendation> data;

  Recommendation.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data'])
        .map((e) => DataRecommendation.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DataRecommendation {
  DataRecommendation({
    required this.entry,
  });
  late final EntryRecommendation entry;

  DataRecommendation.fromJson(Map<String, dynamic> json) {
    entry = EntryRecommendation.fromJson(json['entry']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['entry'] = entry.toJson();
    return _data;
  }
}

class EntryRecommendation {
  EntryRecommendation({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });
  late final int malId;
  late final String url;
  late final Images images;
  late final String title;

  EntryRecommendation.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = Images.fromJson(json['images']);
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['mal_id'] = malId;
    _data['url'] = url;
    _data['images'] = images.toJson();
    _data['title'] = title;
    return _data;
  }
}
