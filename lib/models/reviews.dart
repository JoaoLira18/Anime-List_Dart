import 'general/pagination.dart';
import 'general/reactions.dart';

class Reviews {
  Reviews({
    required this.data,
    required this.pagination,
  });
  late final List<DataReviews> data;
  late final Pagination pagination;

  Reviews.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => DataReviews.fromJson(e)).toList();
    pagination = Pagination.fromJson(json['pagination']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['pagination'] = pagination.toJson();
    return _data;
  }
}

class DataReviews {
  DataReviews({
    required this.user,
    required this.malId,
    required this.url,
    required this.type,
    required this.reactions,
    required this.date,
    required this.review,
    required this.score,
    required this.tags,
    required this.isSpoiler,
    required this.isPreliminary,
    required this.episodesWatched,
  });
  late final User user;
  late final int malId;
  late final String url;
  late final String type;
  late final Reactions reactions;
  late final String date;
  late final String review;
  late final int score;
  late final List<String> tags;
  late final bool isSpoiler;
  late final bool isPreliminary;
  late final int episodesWatched;

  DataReviews.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
    malId = json['mal_id'];
    url = json['url'];
    type = json['type'];
    reactions = Reactions.fromJson(json['reactions']);
    date = json['date'];
    review = json['review'];
    score = json['score'];
    tags = List.castFrom<dynamic, String>(json['tags']);
    isSpoiler = json['is_spoiler'];
    isPreliminary = json['is_preliminary'];
    episodesWatched = json['episodes_watched'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['mal_id'] = malId;
    _data['url'] = url;
    _data['type'] = type;
    _data['reactions'] = reactions.toJson();
    _data['date'] = date;
    _data['review'] = review;
    _data['score'] = score;
    _data['tags'] = tags;
    _data['is_spoiler'] = isSpoiler;
    _data['is_preliminary'] = isPreliminary;
    _data['episodes_watched'] = episodesWatched;
    return _data;
  }
}

class User {
  User({
    required this.username,
    required this.url,
    required this.images,
  });
  late final String username;
  late final String url;
  late final ImagesReviews images;

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    url = json['url'];
    images = ImagesReviews.fromJson(json['images']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['url'] = url;
    _data['images'] = images.toJson();
    return _data;
  }
}

class ImagesReviews {
  ImagesReviews({
    required this.jpg,
    required this.webp,
  });
  late final JpgReviews jpg;
  late final WebpReviews webp;

  ImagesReviews.fromJson(Map<String, dynamic> json) {
    jpg = JpgReviews.fromJson(json['jpg']);
    webp = WebpReviews.fromJson(json['webp']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['jpg'] = jpg.toJson();
    _data['webp'] = webp.toJson();
    return _data;
  }
}

class JpgReviews {
  JpgReviews({
    required this.imageUrl,
  });
  late final String imageUrl;

  JpgReviews.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image_url'] = imageUrl;
    return _data;
  }
}

class WebpReviews {
  WebpReviews({
    required this.imageUrl,
  });
  late final String imageUrl;

  WebpReviews.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image_url'] = imageUrl;
    return _data;
  }
}
