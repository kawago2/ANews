import 'package:demo/models/song_models.dart';
import 'package:demo/services/edsong_service.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../propotionate.dart';
import '../widgets/box_left.dart';
import '../widgets/box_right.dart';
import '../widgets/topbar.dart';

class EndSongScreen extends StatefulWidget {
  static String routeName = '/end-song';
  EndSongScreen({Key? key}) : super(key: key);

  @override
  State<EndSongScreen> createState() => _EndSongScreenState();
}

class _EndSongScreenState extends State<EndSongScreen> {
  late List<Song>? _userEndSong = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userEndSong = (await EndSongAnime().getEndSongAnime())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSColor,
      appBar: topBar(context, 'List Ending OST song'),
      body: ListView.builder(
        itemCount: _userEndSong!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(color: kSColor),
            height: MyUtility(context).height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoxLeftBuilder(
                    condition: _userEndSong![index]
                        .stats
                        .stat
                        .contains(new RegExp('[+]')),
                    condition2: _userEndSong![index]
                        .stats
                        .stat
                        .contains(new RegExp('[NE]')),
                    condition3: _userEndSong![index]
                        .stats
                        .stat
                        .contains(new RegExp('[W]')),
                    rank: index + 1,
                    textstat: _userEndSong![index].stats.stat,
                    textpeak: _userEndSong![index].stats.peak,
                    textpreviously: _userEndSong![index].stats.previously,
                    textweeksOnTop: _userEndSong![index].stats.weeksOnTop),
                BoxRightBuilder(
                  imageUrl: _userEndSong![index].imageUrl,
                  name: _userEndSong![index].title,
                  anime: visibelartis(
                      index, (_userEndSong![index].artists!.length)),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  String visibelartis(int index, int red) {
    if (red < 2) {
      return '${_userEndSong![index].artists![0]}';
    } else {
      return '${_userEndSong![index].artists![0]} ${_userEndSong![index].artists![1]}';
    }
  }
}
