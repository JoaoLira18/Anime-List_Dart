class To {
  To({
    required this.day,
    required this.month,
    required this.year,
  });
  late final int? day;
  late final int? month;
  late final int? year;

  To.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    month = json['month'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day'] = day;
    _data['month'] = month;
    _data['year'] = year;
    return _data;
  }
}
