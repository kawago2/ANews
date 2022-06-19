import 'univ_stats.dart';

class Data {
  String title;
  String imageUrl;
  String studio;
  String? rank;
  Stats stats;

  Data({
    required this.title,
    required this.imageUrl,
    required this.studio,
    required this.rank,
    required this.stats,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        title: json["title"],
        imageUrl: json["imageUrl"],
        studio: json["studio"],
        rank: json["rank"],
        stats: Stats.fromJson(json["stats"]));
  }
}
