import 'univ_stats.dart';

class Male {
  String name;
  String imageUrl;
  String anime;
  String? rank;
  Stats stats;

  Male({
    required this.name,
    required this.imageUrl,
    required this.anime,
    required this.rank,
    required this.stats,
  });

  factory Male.fromJson(Map<String, dynamic> json) {
    return Male(
        name: json["name"],
        imageUrl: json["imageUrl"],
        anime: json["anime"],
        rank: json["rank"],
        stats: Stats.fromJson(json["stats"]));
  }
}
