import 'package:defeefront/widgets/gallary_view_post.dart';
import 'package:flutter/material.dart';

class OtherPost extends StatelessWidget {
  final List<dynamic> posts;
  const OtherPost({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    final limitPosts = posts.take(5).toList();

    return Column(
      children: limitPosts
          .map<Widget>((post) => GallaryViewPost(post: post))
          .toList(),
    );
  }
}
