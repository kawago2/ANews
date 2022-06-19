import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constant.dart';
import '../models/song_models.dart';

class EndSongAnime {
  Future<List<Song>?> getEndSongAnime() async {
    List<Song>? listEndSong;

    var url = Uri.parse(
        EndSongApiConstants.baseUrl + EndSongApiConstants.usersEndpoint);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data["data"] as List;
      print(rest);
      listEndSong = rest.map<Song>((json) => Song.fromJson(json)).toList();
      print("List Size: ${listEndSong.length}");
    }
    return listEndSong;
  }
}
