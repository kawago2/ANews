import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constant.dart';
import '../models/couple_models.dart';

class CoupleAnime {
  Future<List<Couple>?> getCoupleAnime() async {
    List<Couple>? listCouple;

    var url = Uri.parse(
        CoupleApiConstants.baseUrl + CoupleApiConstants.usersEndpoint);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data["data"] as List;
      print(rest);
      listCouple = rest.map<Couple>((json) => Couple.fromJson(json)).toList();
      print("List Size: ${listCouple.length}");
    }
    return listCouple;
  }
}
