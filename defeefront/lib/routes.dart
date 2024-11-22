import 'package:defeefront/screens/headline/headline.dart';
import 'package:defeefront/widgets/basescreen.dart';
import 'package:defeefront/screens/post/post.dart';

import 'package:flutter/material.dart';

final routes = {
  '/': (BuildContext context) => Headline(),
  '/search': (BuildContext context) => Headline(),
  '/recommend': (BuildContext context) => Headline(),
  '/my': (BuildContext context) =>
      PostPage(url: "https://pongpongi.tistory.com/47"),
  // '/my': (context) => const BaseScreen(child: Headline()),
};
