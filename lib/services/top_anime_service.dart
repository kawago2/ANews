import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constant.dart';
import '../models/top_anime_models.dart';

class TopAnime {
  Future<List<Data>?> getTopAnime() async {
    List<Data>? list;

    var url = Uri.parse(
        TopAnimeApiConstants.baseUrl + TopAnimeApiConstants.usersEndpoint);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data["data"] as List;
      print(rest);
      list = rest.map<Data>((json) => Data.fromJson(json)).toList();
      print("List Size: ${list.length}");
    }
    return list;
  }
}
