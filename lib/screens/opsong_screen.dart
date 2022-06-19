import 'package:demo/models/song_models.dart';
import 'package:demo/services/opsong_service.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../propotionate.dart';
import '../widgets/box_left.dart';
import '../widgets/box_right.dart';
import '../widgets/topbar.dart';

class OpSongScreen extends StatefulWidget {
  static String routeName = '/op-song';
  OpSongScreen({Key? key}) : super(key: key);

  @override
  State<OpSongScreen> createState() => _OpSongScreenState();
}

class _OpSongScreenState extends State<OpSongScreen> {
  late List<Song>? _userOpSong = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userOpSong = (await OpSongAnime().getOpSongAnime())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSColor,
      appBar: topBar(context, 'List Opening OST song'),
      body: ListView.builder(
        itemCount: _userOpSong!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(color: kSColor),
            height: MyUtility(context).height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoxLeftBuilder(
                    condition: _userOpSong![index]
                        .stats
                        .stat
                        .contains(RegExp('[+]')),
                    condition2: _userOpSong![index]
                        .stats
                        .stat
                        .contains(RegExp('[NE]')),
                    condition3: _userOpSong![index]
                        .stats
                        .stat
                        .contains(RegExp('[W]')),
                    rank: index + 1,
                    textstat: _userOpSong![index].stats.stat,
                    textpeak: _userOpSong![index].stats.peak,
                    textpreviously: _userOpSong![index].stats.previously,
                    textweeksOnTop: _userOpSong![index].stats.weeksOnTop),
                BoxRightBuilder(
                  imageUrl: _userOpSong![index].imageUrl,
                  name: _userOpSong![index].title,
                  anime: visibelartis(
                      index, (_userOpSong![index].artists!.length)),
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
      return '${_userOpSong![index].artists![0]}';
    } else {
      return '${_userOpSong![index].artists![0]} ${_userOpSong![index].artists![1]}';
    }
  }
}
