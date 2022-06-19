import 'package:demo/constant.dart';
import 'package:demo/propotionate.dart';
import 'package:demo/widgets/box_right.dart';
import 'package:flutter/material.dart';

import '../models/top_anime_models.dart';
import '../services/top_anime_service.dart';
import '../widgets/box_left.dart';
import '../widgets/topbar.dart';

class TopAnimeScreen extends StatefulWidget {
  TopAnimeScreen({Key? key}) : super(key: key);
  static String routeName = '/top-anime';
  @override
  State<TopAnimeScreen> createState() => _TopAnimeScreenState();
}

class _TopAnimeScreenState extends State<TopAnimeScreen> {
  late List<Data>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await TopAnime().getTopAnime())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context, 'Top Anime'),
      body: ListViewTopAnime(userModel: _userModel),
    );
  }
}

class ListViewTopAnime extends StatelessWidget {
  const ListViewTopAnime({
    Key? key,
    required List<Data>? userModel,
  })  : _userModel = userModel,
        super(key: key);

  final List<Data>? _userModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _userModel!.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(color: kSColor),
          height: MyUtility(context).height * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoxLeftBuilder(
                condition:
                    _userModel![index].stats.stat.contains(RegExp('[+]')),
                condition2:
                    _userModel![index].stats.stat.contains(RegExp('[NE]')),
                condition3:
                    _userModel![index].stats.stat.contains(RegExp('[W]')),
                rank: index + 1,
                textstat: _userModel![index].stats.stat,
                textpeak: _userModel![index].stats.peak,
                textpreviously: _userModel![index].stats.previously,
                textweeksOnTop: _userModel![index].stats.weeksOnTop,
              ),
              BoxRightBuilder(
                imageUrl: _userModel![index].imageUrl,
                name: _userModel![index].title,
                anime: _userModel![index].studio,
              ),
            ],
          ),
        );
      },
    );
  }
}
