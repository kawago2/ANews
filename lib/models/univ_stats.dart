
class Stats {
  String peak;
  String previously;
  String weeksOnTop;
  String status;
  String stat;

  Stats({
    required this.peak,
    required this.previously,
    required this.weeksOnTop,
    required this.status,
    required this.stat,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      peak: json["peak"].toString(),
      previously: json["previously"].toString(),
      weeksOnTop: json["weeksOnTop"].toString(),
      status: json["status"] as String,
      stat: json["stat"] as String,
    );
  }
}
