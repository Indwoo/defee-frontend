import 'package:defeefront/screens/headline/widgets/category.dart';
import 'package:defeefront/screens/headline/widgets/other_post.dart';
import 'package:defeefront/screens/headline/widgets/popular.dart';
import 'package:defeefront/screens/headline/widgets/slide_post.dart';
import 'package:defeefront/widgets/basescreen.dart';
import 'package:defeefront/widgets/gallary_view_post.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Headline extends StatefulWidget {
  const Headline({super.key});

  @override
  _HeadlineState createState() => _HeadlineState();
}

class _HeadlineState extends State<Headline> {
  List<dynamic> posts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      Dio dio = Dio();

      final response = await dio.get('http://localhost:8080/api/posts');

      setState(() {
        posts = response.data;
        isLoading = false;
      });
    } catch (e) {
      // 오류 처리
      if (e is DioError) {
        // DioError일 경우
        print('Error: ${e.response?.statusCode}');
        print('Error Message: ${e.message}');
      } else {
        print('Unexpected Error: $e');
      }

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  // 카테고리
                  Category(),
                  // 인기 포스트
                  GestureDetector(
                    onTap: () {
                      final postUrl = posts[0]['url'];
                      Navigator.pushNamed(
                        context,
                        '/post',
                        arguments: postUrl,
                      );
                    },
                    child: GallaryViewPost(post: posts[0]),
                  ),
                  // 포스트 컨텐츠
                  SlidePost(posts: posts),
                  // 하단 나머지 포스트
                  OtherPost(posts: posts),
                ],
              ),
      ),
    );
  }
}
