class Trailer {
  Trailer({
    required this.youtubeId,
    required this.url,
    required this.embedUrl,
  });
  late final String youtubeId;
  late final String? url;
  late final String? embedUrl;

  Trailer.fromJson(Map<String, dynamic> json) {
    youtubeId = json['youtube_id'] ?? "";
    url = json['url'];
    embedUrl = json['embed_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['youtube_id'] = youtubeId;
    _data['url'] = url;
    _data['embed_url'] = embedUrl;
    return _data;
  }
}
