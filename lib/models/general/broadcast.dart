class Broadcast {
  Broadcast({
    required this.day,
    required this.time,
    required this.timezone,
    required this.string,
  });
  late final String? day;
  late final String? time;
  late final String? timezone;
  late final String? string;

  Broadcast.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    time = json['time'];
    timezone = json['timezone'];
    string = json['string'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day'] = day;
    _data['time'] = time;
    _data['timezone'] = timezone;
    _data['string'] = string;
    return _data;
  }
}
