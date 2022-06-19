import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constant.dart';
import '../models/male_char.dart';

class MaleChar {
  Future<List<Male>?> getMaleAnime() async {
    List<Male>? listMale;

    var url = Uri.parse(
        MaleApiConstants.baseUrl + MaleApiConstants.usersEndpoint);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data["data"] as List;
      print(rest);
      listMale = rest.map<Male>((json) => Male.fromJson(json)).toList();
      print("List Size: ${listMale.length}");
    }
    return listMale;
  }
}
