import 'package:anilist/models/general/index.dart';

class Pagination {
  Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.items,
  });
  late final int? lastVisiblePage;
  late final bool? hasNextPage;
  late final Items items;

  Pagination.fromJson(Map<String, dynamic> json) {
    lastVisiblePage = json['last_visible_page'];
    hasNextPage = json['has_next_page'];
    items = json['items'] != null
        ? Items.fromJson(json['items'])
        : Items(count: null, total: null, perPage: null);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['last_visible_page'] = lastVisiblePage;
    _data['has_next_page'] = hasNextPage;
    _data['items'] = items.toJson();
    return _data;
  }
}
