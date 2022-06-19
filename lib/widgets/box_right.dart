import 'package:flutter/material.dart';

import '../constant.dart';
import '../propotionate.dart';

class BoxRightBuilder extends StatelessWidget {
  final String imageUrl;
  final name;
  final String? anime;
  BoxRightBuilder({
    Key? key,
    required this.imageUrl,
    required this.name,
    this.anime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          spreadRadius: 2,
                          blurRadius: 1,
                          blurStyle: BlurStyle.normal,
                          offset: Offset(3, 3)
                          // changes position of shadow
                          ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                      width: MyUtility(context).width * 0.30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
              ),
            ),
            visibleanimetext(anime),
          ],
        ),
      ),
    );
  }

  Text visibleanimetext(anime) {
    if (anime == null) {
      return Text('');
    } else {
      return Text(
        anime,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16,
          color: kFColor,
        ),
      );
    }
  }
}
