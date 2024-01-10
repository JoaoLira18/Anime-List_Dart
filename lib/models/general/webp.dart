class Webp {
  Webp({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });
  late final String imageUrl;
  late final String smallImageUrl;
  late final String largeImageUrl;

  Webp.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    smallImageUrl = json['small_image_url'];
    largeImageUrl = json['large_image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image_url'] = imageUrl;
    _data['small_image_url'] = smallImageUrl;
    _data['large_image_url'] = largeImageUrl;
    return _data;
  }
}
