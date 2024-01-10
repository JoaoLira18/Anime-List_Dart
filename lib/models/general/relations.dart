import 'entry.dart';

class Relations {
  Relations({
    required this.relation,
    required this.entry,
  });
  late final String? relation;
  late final List<Entry> entry;

  Relations.fromJson(Map<String, dynamic> json) {
    relation = json['relation'];
    entry = List.from(json['entry']).map((e) => Entry.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['relation'] = relation;
    _data['entry'] = entry.map((e) => e.toJson()).toList();
    return _data;
  }
}
