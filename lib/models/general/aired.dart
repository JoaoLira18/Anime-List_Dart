import 'props.dart';

class Aired {
  Aired({
    required this.from,
    required this.to,
    required this.prop,
  });
  late final String? from;
  late final String? to;
  late final Prop prop;

  Aired.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    prop = Prop.fromJson(json['prop']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['from'] = from;
    _data['to'] = to;
    _data['prop'] = prop.toJson();
    return _data;
  }
}
