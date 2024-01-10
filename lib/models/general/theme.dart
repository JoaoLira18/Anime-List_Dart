class Theme {
  Theme({
    required this.openings,
    required this.endings,
  });
  late final List<String> openings;
  late final List<String> endings;

  Theme.fromJson(Map<String, dynamic> json) {
    openings = List.castFrom<dynamic, String>(json['openings']);
    endings = List.castFrom<dynamic, String>(json['endings']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['openings'] = openings;
    _data['endings'] = endings;
    return _data;
  }
}
