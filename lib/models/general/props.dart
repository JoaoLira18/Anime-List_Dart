import 'from.dart';
import 'to.dart';

class Prop {
  Prop({
    required this.from,
    required this.to,
    required this.string,
  });
  late final From from;
  late final To to;
  late final String? string;

  Prop.fromJson(Map<String, dynamic> json) {
    from = From.fromJson(json['from']);
    to = To.fromJson(json['to']);
    // string = json['string'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['from'] = from.toJson();
    _data['to'] = to.toJson();
    _data['string'] = string;
    return _data;
  }
}
