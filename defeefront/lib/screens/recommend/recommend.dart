import 'package:defeefront/widgets/basescreen.dart';
import 'package:defeefront/widgets/gallary_view_post.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Recommend extends StatefulWidget {
  const Recommend({super.key});

  @override
  State<Recommend> createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
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
      final response =
          await dio.get('http://localhost:8080/api/recommended-posts');

      setState(() {
        posts = response.data;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching posts: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children:
                    posts.map((post) => GallaryViewPost(post: post)).toList(),
              ),
      ),
    );
  }
}
