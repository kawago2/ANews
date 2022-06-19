
import 'package:flutter/widgets.dart';

import 'screens/couple_screen.dart';
import 'screens/endsong_screen.dart';
import 'screens/female_screen.dart';
import 'screens/home_page.dart';
import 'screens/male_screen.dart';
import 'screens/opsong_screen.dart';
import 'screens/top_anime.dart';
import 'screens/wellcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WellcomeScreen.routeName: (context) => WellcomeScreen(),
  HomePage.routeName: (context) => HomePage(),
  TopAnimeScreen.routeName: (context) => TopAnimeScreen(),
  CoupleScreen.routeName: (context) => CoupleScreen(),
  MaleScreen.routeName: (context) => MaleScreen(),
  FemaleScreen.routeName: (context) => FemaleScreen(),
  OpSongScreen.routeName: (context) => OpSongScreen(),
  EndSongScreen.routeName: (context) => EndSongScreen(),
};
