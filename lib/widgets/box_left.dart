import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../constant.dart';
import '../propotionate.dart';

class BoxLeftBuilder extends StatelessWidget {
  final condition;
  final String textstat;
  final String textpeak;
  final String textpreviously;
  final String textweeksOnTop;
  final condition2;
  final condition3;

  final int rank;
  BoxLeftBuilder({
    Key? key,
    this.condition,
    required this.textstat,
    required this.textpeak,
    required this.textpreviously,
    required this.textweeksOnTop,
    required this.rank,
    this.condition2,
    this.condition3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MyUtility(context).height * 0.25,
          width: MyUtility(context).width * 0.12,
          decoration: BoxDecoration(
            color: kTColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MyUtility(context).height * 0.08,
                child: getMyicons(condition, condition2, condition3),
              ),
              Divider(height: 10),
              Text(textstat),
              Divider(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LineIcons.byName('jedi')),
                  Text(textpeak),
                ],
              ),
              Divider(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.reply_all),
                  Text(textpreviously),
                ],
              ),
              Divider(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history),
                  Text(textweeksOnTop),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: MyUtility(context).height * 0.25,
          width: MyUtility(context).width * 0.15,
          decoration: BoxDecoration(
            color: kPColor,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$rank',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rank',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getMyicons(var dex, var con, var dip) {
    if (dex == true) {
      return Icon(
        Icons.arrow_upward_sharp,
        color: kPColor,
      );
    }
    if (con == true) {
      return Icon(
        Icons.add,
        color: kPColor,
      );
    }
    if (dip == true) {
      return Icon(
        LineIcons.arrowRight,
        color: kPColor,
      );
    } else {
      return Icon(
        Icons.arrow_downward_sharp,
        color: kPColor,
      );
    }
  }
}
