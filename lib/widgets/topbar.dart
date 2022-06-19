import 'package:flutter/material.dart';

import '../constant.dart';
import '../propotionate.dart';

PreferredSize topBar(BuildContext context, String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: AppBar(
      toolbarHeight: MyUtility(context).height * 0.5,
      elevation: 0.1,
      backgroundColor: kPColor,
      title: Text(
        title,
      ),
    ),
  );
}
