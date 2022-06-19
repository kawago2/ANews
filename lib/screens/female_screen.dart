import 'package:demo/services/female_service.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/female_char.dart';
import '../propotionate.dart';
import '../widgets/box_left.dart';
import '../widgets/box_right.dart';
import '../widgets/topbar.dart';

class FemaleScreen extends StatefulWidget {
  static String routeName = '/female-char';
  FemaleScreen({Key? key}) : super(key: key);

  @override
  State<FemaleScreen> createState() => _FemaleScreenState();
}

class _FemaleScreenState extends State<FemaleScreen> {
  late List<Female>? _userFemale = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userFemale = (await FemaleChar().getFemaleAnime())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSColor,
      appBar: topBar(context, 'List Female Character'),
      body: ListViewFemale(userFemale: _userFemale),
    );
  }
}

class ListViewFemale extends StatelessWidget {
  const ListViewFemale({
    Key? key,
    required List<Female>? userFemale,
  })  : _userFemale = userFemale,
        super(key: key);

  final List<Female>? _userFemale;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _userFemale!.length,
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
                    _userFemale![index].stats.stat.contains(RegExp('[+]')),
                condition2:
                    _userFemale![index].stats.stat.contains(RegExp('[NE]')),
                condition3:
                    _userFemale![index].stats.stat.contains(RegExp('[W]')),
                rank: index + 1,
                textstat: _userFemale![index].stats.stat,
                textpeak: _userFemale![index].stats.peak,
                textpreviously: _userFemale![index].stats.previously,
                textweeksOnTop: _userFemale![index].stats.weeksOnTop,
              ),
              BoxRightBuilder(
                  imageUrl: _userFemale![index].imageUrl,
                  name: _userFemale![index].name,
                  anime: _userFemale![index].anime)
            ],
          ),
        );
      },
    );
  }
}
