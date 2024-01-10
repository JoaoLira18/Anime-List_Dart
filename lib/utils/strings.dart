class Strings {
  static Map<String, String> _strings = {
    "top": "Top",
    "anime": "Anime",
    "manga": "Mangá",
    "summer": "Summer",
    "top_anime": "Top Anime",
    "top_manga": "Top Mangas",
    "no_data": "Data not Found",
    "season_now": "Actual Season",
    "error": "Error, try again later",
  };

  static getString(string) {
    return _strings[string];
  }
}
