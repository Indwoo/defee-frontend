import 'package:defeefront/widgets/basescreen.dart';
import 'package:defeefront/widgets/gallary_view_post.dart';
import 'package:flutter/material.dart';

class Recommend extends StatefulWidget {
  const Recommend({super.key});

  @override
  State<Recommend> createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            GallaryViewPost(),
            GallaryViewPost(),
            GallaryViewPost(),
          ],
        ),
      ),
    );
  }
}
