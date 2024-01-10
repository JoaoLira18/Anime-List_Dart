import 'general/index.dart';

class Anime {
  Anime({
    required this.data,
    required this.pagination,
  });
  late final List<DataAnime> data;
  late final Pagination pagination;

  Anime.fromJson(Map<String, dynamic> json) {
    pagination = Pagination.fromJson(json['pagination']);
    data = List.from(json['data']).map((e) => DataAnime.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pagination'] = pagination.toJson();
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DataAnime {
  DataAnime({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.season,
    required this.year,
    required this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });
  late final int malId;
  late final String? url;
  late final Images images;
  late final Trailer trailer;
  late final bool? approved;
  late final List<Titles> titles;
  late final String? title;
  late final String? titleEnglish;
  late final String? titleJapanese;
  late final List<String> titleSynonyms;
  late final String? type;
  late final String? source;
  late final int? episodes;
  late final String? status;
  late final bool? airing;
  late final Aired aired;
  late final String? duration;
  late final String? rating;
  late final double? score;
  late final int? scoredBy;
  late final int? rank;
  late final int? popularity;
  late final int? members;
  late final int? favorites;
  late final String synopsis;
  late final String? background;
  late final String? season;
  late final int? year;
  late final Broadcast broadcast;
  late final List<Producers> producers;
  late final List<Licensors> licensors;
  late final List<Studios> studios;
  late final List<Genres> genres;
  late final List<ExplicitGenres> explicitGenres;
  late final List<Themes> themes;
  late final List<Demographics> demographics;

  DataAnime.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = Images.fromJson(json['images']);
    trailer = json['trailer'] != null
        ? Trailer.fromJson(json['trailer'])
        : Trailer(youtubeId: '', url: '', embedUrl: '');
    approved = json['approved'];
    titles = json['titles'] != null
        ? List.from(json['titles']).map((e) => Titles.fromJson(e)).toList()
        : [];
    title = json['title'];
    titleEnglish = json['title_english'] ?? 'No Title';
    titleJapanese = json['title_japanese'];
    titleSynonyms = json['title_synonyms'] != null
        ? List.castFrom<dynamic, String>(json['title_synonyms'])
        : [];
    type = json['type'];
    source = json['source'];
    episodes = json['episodes'];
    status = json['status'];
    airing = json['airing'];
    aired = json['aired'] != null
        ? Aired.fromJson(json['aired'])
        : Aired(
            from: null,
            to: null,
            prop: Prop(
                from: From(day: null, month: null, year: null),
                to: To(day: null, month: null, year: null),
                string: null));
    duration = json['duration'];
    rating = json['rating'];
    score = json['score'] != null ? json['score'].toDouble() : 0;
    scoredBy = json['scored_by'];
    rank = json['rank'];
    popularity = json['popularity'];
    members = json['members'];
    favorites = json['favorites'];
    synopsis = json['synopsis'] ?? '';
    background = json['background'];
    season = json['season'];
    year = json['year'];
    broadcast = json['broadcast'] != null
        ? Broadcast.fromJson(json['broadcast'])
        : Broadcast(day: null, time: null, timezone: null, string: null);
    producers = json['producers'] != null
        ? List.from(json['producers'])
            .map((e) => Producers.fromJson(e))
            .toList()
        : [];
    licensors = json['licensors'] != null
        ? List.from(json['licensors'])
            .map((e) => Licensors.fromJson(e))
            .toList()
        : [];
    studios = json['studios'] != null
        ? List.from(json['studios']).map((e) => Studios.fromJson(e)).toList()
        : [];
    genres = json['genres'] != null
        ? List.from(json['genres']).map((e) => Genres.fromJson(e)).toList()
        : [];
    explicitGenres = json['explicit_genres'] != null
        ? List.from(json['explicit_genres'])
            .map((e) => ExplicitGenres.fromJson(e))
            .toList()
        : [];
    themes = json['themes'] != null
        ? List.from(json['themes']).map((e) => Themes.fromJson(e)).toList()
        : [];
    demographics = json['demographics'] != null
        ? List.from(json['demographics'])
            .map((e) => Demographics.fromJson(e))
            .toList()
        : [];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['mal_id'] = malId;
    _data['url'] = url;
    _data['images'] = images.toJson();
    _data['trailer'] = trailer.toJson();
    _data['approved'] = approved;
    _data['titles'] = titles.map((e) => e.toJson()).toList();
    _data['title'] = title;
    _data['title_english'] = titleEnglish;
    _data['title_japanese'] = titleJapanese;
    _data['title_synonyms'] = titleSynonyms;
    _data['type'] = type;
    _data['source'] = source;
    _data['episodes'] = episodes;
    _data['status'] = status;
    _data['airing'] = airing;
    _data['aired'] = aired.toJson();
    _data['duration'] = duration;
    _data['rating'] = rating;
    _data['score'] = score;
    _data['scored_by'] = scoredBy;
    _data['rank'] = rank;
    _data['popularity'] = popularity;
    _data['members'] = members;
    _data['favorites'] = favorites;
    _data['synopsis'] = synopsis;
    _data['background'] = background;
    _data['season'] = season;
    _data['year'] = year;
    _data['broadcast'] = broadcast.toJson();
    _data['producers'] = producers.map((e) => e.toJson()).toList();
    _data['licensors'] = licensors.map((e) => e.toJson()).toList();
    _data['studios'] = studios.map((e) => e.toJson()).toList();
    _data['genres'] = genres.map((e) => e.toJson()).toList();
    _data['explicit_genres'] = explicitGenres.map((e) => e.toJson()).toList();
    _data['themes'] = themes.map((e) => e.toJson()).toList();
    _data['demographics'] = demographics.map((e) => e.toJson()).toList();
    return _data;
  }
}
