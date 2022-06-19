import 'univ_stats.dart';

class Couple {
  List<String> names;
  CoupleImages coupleImages;
  String anime;
  String? rank;
  Stats stats;

  Couple({
    required this.names,
    required this.coupleImages,
    required this.anime,
    required this.rank,
    required this.stats,
  });

  factory Couple.fromJson(Map<String, dynamic> json) {
    return Couple(
        names: List<String>.from(json["names"].map((x) => x)),
        coupleImages: CoupleImages.fromJson(json["coupleImages"]),
        anime: json["anime"],
        rank: json["rank"],
        stats: Stats.fromJson(json["stats"]));
  }
}

class CoupleImages {
  String imageUrlOne;
  String imageUrlTwo;

  CoupleImages({
    required this.imageUrlOne,
    required this.imageUrlTwo,
  });

  factory CoupleImages.fromJson(Map<String, dynamic> json) {
    return CoupleImages(
      imageUrlOne: json["imageUrlOne"],
      imageUrlTwo: json["imageUrlTwo"],
    );
  }
}
