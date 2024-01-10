class Items {
  Items({
    required this.count,
    required this.total,
    required this.perPage,
  });
  late final int? count;
  late final int? total;
  late final int? perPage;

  Items.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    total = json['total'];
    perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['total'] = total;
    _data['per_page'] = perPage;
    return _data;
  }
}
