import 'univ_stats.dart';

class Song {
  String title;
  String imageUrl;
  List<String>? artists;
  String rank;
  Stats stats;

  Song({
    required this.title,
    required this.imageUrl,
    required this.artists,
    required this.rank,
    required this.stats,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
        title: json["title"],
        imageUrl: json["imageUrl"],
        artists: List<String>.from(json["artists"].map((x) => x)),
        rank: json["rank"].toString(),
        stats: Stats.fromJson(json["stats"]));
  }
}
