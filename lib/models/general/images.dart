import 'jpg.dart';
import 'webp.dart';

class Images {
  Images({
    required this.jpg,
    required this.webp,
  });
  late final Jpg jpg;
  late final Webp webp;

  Images.fromJson(Map<String, dynamic> json) {
    jpg = Jpg.fromJson(json['jpg']);
    webp = Webp.fromJson(json['webp']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['jpg'] = jpg.toJson();
    _data['webp'] = webp.toJson();
    return _data;
  }
}
