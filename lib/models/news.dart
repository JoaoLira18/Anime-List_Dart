import 'general/index.dart';

class News {
  News({
    required this.pagination,
    required this.data,
  });
  late final Pagination pagination;
  late final List<DataNews> data;

  News.fromJson(Map<String, dynamic> json) {
    pagination = Pagination.fromJson(json['pagination']);
    data = List.from(json['data']).map((e) => DataNews.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pagination'] = pagination.toJson();
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DataNews {
  DataNews({
    required this.url,
    required this.date,
    required this.malId,
    required this.title,
    required this.images,
    required this.excerpt,
    required this.comments,
    required this.forumUrl,
    required this.authorUrl,
    required this.authorUsername,
  });
  late final int malId;
  late final String url;
  late final String date;
  late final String title;
  late final int comments;
  late final String excerpt;
  late final String forumUrl;
  late final String authorUrl;
  late final ImagesNews images;
  late final String authorUsername;

  DataNews.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    date = json['date'];
    title = json['title'];
    malId = json['mal_id'];
    excerpt = json['excerpt'];
    comments = json['comments'];
    forumUrl = json['forum_url'];
    authorUrl = json['author_url'];
    authorUsername = json['author_username'];
    images = ImagesNews.fromJson(json['images']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['date'] = date;
    _data['title'] = title;
    _data['mal_id'] = malId;
    _data['excerpt'] = excerpt;
    _data['comments'] = comments;
    _data['forum_url'] = forumUrl;
    _data['author_url'] = authorUrl;
    _data['images'] = images.toJson();
    _data['author_username'] = authorUsername;
    return _data;
  }
}

class ImagesNews {
  ImagesNews({
    required this.jpg,
  });
  late final JpgNews jpg;

  ImagesNews.fromJson(Map<String, dynamic> json) {
    jpg = JpgNews.fromJson(json['jpg']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['jpg'] = jpg.toJson();
    return _data;
  }
}

class JpgNews {
  JpgNews({
    required this.imageUrl,
  });
  late final String imageUrl;

  JpgNews.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image_url'] = imageUrl;
    return _data;
  }
}
