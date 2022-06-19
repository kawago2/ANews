import 'univ_stats.dart';

class Female {
  String name;
  String imageUrl;
  String anime;
  String? rank;
  Stats stats;

  Female({
    required this.name,
    required this.imageUrl,
    required this.anime,
    required this.rank,
    required this.stats,
  });

  factory Female.fromJson(Map<String, dynamic> json) {
    return Female(
        name: json["name"],
        imageUrl: json["imageUrl"],
        anime: json["anime"],
        rank: json["rank"],
        stats: Stats.fromJson(json["stats"]));
  }
}
