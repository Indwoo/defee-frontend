import 'package:defeefront/screens/headline/widgets/slide_item.dart';
import 'package:flutter/material.dart';
import 'package:defeefront/themes/app_theme.dart';

class SlidePost extends StatelessWidget {
  final List<dynamic> posts;
  const SlidePost({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    final limitPosts = posts.take(5).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: limitPosts
                .map<Widget>((post) => SlideItem(post: post))
                .toList(),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            print("Button clicked!");
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 55),
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          ),
          child: Text(
            "전체 포스트 컨텐츠",
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
        SizedBox(height: 10),
        Divider(
          color: Theme.of(context).colorScheme.outlineVariant,
          thickness: 1,
        ),
      ],
    );
  }
}
