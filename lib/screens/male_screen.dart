import 'package:demo/constant.dart';
import 'package:demo/services/male_service.dart';
import 'package:demo/widgets/box_right.dart';
import 'package:demo/widgets/topbar.dart';
import 'package:flutter/material.dart';

import '../models/male_char.dart';
import '../propotionate.dart';
import '../widgets/box_left.dart';

class MaleScreen extends StatefulWidget {
  static String routeName = '/male-char';
  MaleScreen({Key? key}) : super(key: key);

  @override
  State<MaleScreen> createState() => _MaleScreenState();
}

class _MaleScreenState extends State<MaleScreen> {
  late List<Male>? _userMale = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userMale = (await MaleChar().getMaleAnime())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSColor,
      appBar: topBar(context, 'List Male Character'),
      body: ListViewMale(userMale: _userMale),
    );
  }
}

class ListViewMale extends StatelessWidget {
  const ListViewMale({
    Key? key,
    required List<Male>? userMale,
  }) : _userMale = userMale, super(key: key);

  final List<Male>? _userMale;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _userMale!.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(color: kSColor),
          height: MyUtility(context).height * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoxLeftBuilder(
                  condition: _userMale![index]
                      .stats
                      .stat
                      .contains(RegExp('[+]')),
                  condition2: _userMale![index]
                      .stats
                      .stat
                      .contains(RegExp('[NE]')),
                  condition3: _userMale![index]
                      .stats
                      .stat
                      .contains(RegExp('[W]')),
                  rank: index + 1,
                  textstat: _userMale![index].stats.stat,
                  textpeak: _userMale![index].stats.peak,
                  textpreviously: _userMale![index].stats.previously,
                  textweeksOnTop: _userMale![index].stats.weeksOnTop),
              BoxRightBuilder(
                  imageUrl: _userMale![index].imageUrl,
                  name: _userMale![index].name,
                  anime: _userMale![index].anime)
            ],
          ),
        );
      },
    );
  }
}
