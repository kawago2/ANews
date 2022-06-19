import 'package:demo/propotionate.dart';
import 'package:demo/screens/couple_screen.dart';
import 'package:demo/screens/endsong_screen.dart';
import 'package:demo/screens/female_screen.dart';
import 'package:demo/screens/male_screen.dart';
import 'package:demo/screens/opsong_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../constant.dart';
import '../widgets/topbar.dart';
import 'top_anime.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPColor,
      appBar: topBar(context, 'Index List'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListButtonIndex(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                LineIcons.github,
                color: kTColor,
                size: MyUtility(context).height * 0.1,
              ),
              Text('Application by kawago'),
              SizedBox(height: 5),
              Text('Rest API by satyawikananda'),
              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}

class ListButtonIndex extends StatelessWidget {
  const ListButtonIndex({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardList(
          title: 'Top Anime',
          onTap: () {
            Navigator.pushNamed(context, TopAnimeScreen.routeName);
          },
        ),
        CardList(
          title: 'Couple',
          onTap: () {
            Navigator.pushNamed(context, CoupleScreen.routeName);
          },
        ),
        CardList(
          title: 'Male Character',
          onTap: () {
            Navigator.pushNamed(context, MaleScreen.routeName);
          },
        ),
        CardList(
          title: 'Female Character',
          onTap: () {
            Navigator.pushNamed(context, FemaleScreen.routeName);
          },
        ),
        CardList(
          title: 'Opening OST song',
          onTap: () {
            Navigator.pushNamed(context, OpSongScreen.routeName);
          },
        ),
        CardList(
          title: 'Ending OST song',
          onTap: () {
            Navigator.pushNamed(context, EndSongScreen.routeName);
          },
        ),
      ],
    );
  }
}

class CardList extends StatelessWidget {
  final GestureTapCallback onTap;
  final String title;
  const CardList({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: kSColor,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
