import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constant.dart';
import '../models/female_char.dart';

class FemaleChar {
  Future<List<Female>?> getFemaleAnime() async {
    List<Female>? listFemale;

    var url = Uri.parse(
        FemaleApiConstants.baseUrl + FemaleApiConstants.usersEndpoint);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data["data"] as List;
      print(rest);
      listFemale = rest.map<Female>((json) => Female.fromJson(json)).toList();
      print("List Size: ${listFemale.length}");
    }
    return listFemale;
  }
}
