import 'package:defeefront/screens/headline/widgets/category.dart';
import 'package:defeefront/screens/headline/widgets/other_post.dart';
import 'package:defeefront/screens/headline/widgets/popular.dart';
import 'package:defeefront/screens/headline/widgets/post_content.dart';
import 'package:defeefront/widgets/footer.dart';
import 'package:defeefront/widgets/header.dart';
import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  const Headline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: const Column(
          children: [
            // 카테고리
            Category(),
            // 인기 포스트
            Popular(),
            // 포스트 컨텐츠
            PostContent(),
            // 하단 나머지 포스트
            OtherPost(),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
