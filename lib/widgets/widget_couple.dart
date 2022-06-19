
import 'package:flutter/material.dart';

import '../models/couple_models.dart';
import '../propotionate.dart';

class ImageCouple extends StatelessWidget {
  final int index;
  const ImageCouple({
    Key? key,
    required List<Couple>? userCouple,
    required this.index,
  })  : _userCouple = userCouple,
        super(key: key);

  final List<Couple>? _userCouple;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              _userCouple![index].coupleImages.imageUrlOne,
              fit: BoxFit.fill,
              width: MyUtility(context).width * 0.30,
            ),
          ),
        ),
        SizedBox(width: 20),
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
              _userCouple![index].coupleImages.imageUrlTwo,
              fit: BoxFit.fill,
              width: MyUtility(context).width * 0.30,
            ),
          ),
        ),
      ],
    );
  }
}
