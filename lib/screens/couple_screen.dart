import 'package:demo/constant.dart';
import 'package:flutter/material.dart';

import '../models/couple_models.dart';
import '../propotionate.dart';
import '../services/couple_service.dart';
import '../widgets/box_left.dart';
import '../widgets/topbar.dart';

import '../widgets/widget_couple.dart';

class CoupleScreen extends StatefulWidget {
  const CoupleScreen({Key? key}) : super(key: key);
  static String routeName = '/couple';
  @override
  State<CoupleScreen> createState() => _CoupleScreenState();
}

class _CoupleScreenState extends State<CoupleScreen> {
  late List<Couple>? _userCouple = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userCouple = (await CoupleAnime().getCoupleAnime())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSColor,
      appBar: topBar(context, 'List Couple'),
      body: ListViewCouple(userCouple: _userCouple),
    );
  }

  Widget getMyicons(var dex) {
    if (dex == true) {
      return Icon(
        Icons.arrow_upward_sharp,
        color: kPColor,
      );
    } else {
      return Icon(
        Icons.arrow_downward_sharp,
        color: kSColor,
      );
    }
  }
}

class ListViewCouple extends StatelessWidget {
  const ListViewCouple({
    Key? key,
    required List<Couple>? userCouple,
  })  : _userCouple = userCouple,
        super(key: key);

  final List<Couple>? _userCouple;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(color: kSColor),
          height: MyUtility(context).height * 0.3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoxLeftBuilder(
                condition:
                    _userCouple![index].stats.stat.contains(RegExp('[+]')),
                condition2:
                    _userCouple![index].stats.stat.contains(RegExp('[NE]')),
                condition3:
                    _userCouple![index].stats.stat.contains(RegExp('[W]')),
                rank: index + 1,
                textstat: _userCouple![index].stats.stat,
                textpeak: _userCouple![index].stats.peak,
                textpreviously: _userCouple![index].stats.previously,
                textweeksOnTop: _userCouple![index].stats.weeksOnTop,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      ImageCouple(
                        userCouple: _userCouple,
                        index: index,
                      ),
                      SizedBox(height: 25),
                      Text(
                        '${_userCouple![index].names[0]} x ${_userCouple![index].names[1]}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        _userCouple![index].anime,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: kFColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: _userCouple!.length,
    );
  }
}
