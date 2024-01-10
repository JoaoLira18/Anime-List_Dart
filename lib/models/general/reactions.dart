class Reactions {
  Reactions({
    required this.overall,
    required this.nice,
    required this.loveIt,
    required this.funny,
    required this.confusing,
    required this.informative,
    required this.wellWritten,
    required this.creative,
  });
  late final int overall;
  late final int nice;
  late final int loveIt;
  late final int funny;
  late final int confusing;
  late final int informative;
  late final int wellWritten;
  late final int creative;

  Reactions.fromJson(Map<String, dynamic> json) {
    overall = json['overall'];
    nice = json['nice'];
    loveIt = json['love_it'];
    funny = json['funny'];
    confusing = json['confusing'];
    informative = json['informative'];
    wellWritten = json['well_written'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['overall'] = overall;
    _data['nice'] = nice;
    _data['love_it'] = loveIt;
    _data['funny'] = funny;
    _data['confusing'] = confusing;
    _data['informative'] = informative;
    _data['well_written'] = wellWritten;
    _data['creative'] = creative;
    return _data;
  }
}
