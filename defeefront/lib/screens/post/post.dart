import 'package:flutter/material.dart';

import 'package:defeefront/widgets/footer.dart';
import 'package:defeefront/screens/post/widgets/post_app_bar.dart';
import 'package:defeefront/screens/post/widgets/post_content.dart';

class PostPage extends StatelessWidget {
  final String url;

  const PostPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PostAppBar(url: url),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          children: [
            Expanded(
              // 남은 공간을 차지하도록 설정
              child: PostContent(
                url: url,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
