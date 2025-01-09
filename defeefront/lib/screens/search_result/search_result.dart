import 'package:defeefront/screens/headline/widgets/other_post.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../widgets/basescreen.dart';


class SearchResult extends StatefulWidget {
  final String results; // 검색어를 저장할 변수
  const SearchResult({super.key, required this.results}); // 생성자에서 keyword를 받음

  @override
  _SearchResult createState() => _SearchResult();
}

class _SearchResult extends State<SearchResult> {
  List<dynamic> filteredPosts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFilteredTitles();
  }

  Future<void> fetchFilteredTitles() async {
    try {
      Dio dio = Dio();
      final response = await dio.get('http://localhost:8080/api/posts');
      final allPosts = response.data;

      setState(() {
        // 검색어와 일치하는 제목 필터링
        filteredPosts = allPosts
            .where((post) =>
                post['title'] != null &&
                post['title']
                    .toString()
                    .toLowerCase()
                    .contains(widget.results.toLowerCase()))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      if (e is DioException) {
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
            : filteredPosts.isEmpty
            ? Center(
          child: Text(
            '검색 결과가 없습니다.',
            style: TextStyle(fontSize: 16.0),
          ),
        )
            : Column(
          children: [
            // 인기 포스트 (검색 결과의 첫 번째 항목)
            if (filteredPosts.isNotEmpty)
              GestureDetector(
                onTap: () {
                  final postUrl = filteredPosts[0]['url'];
                  Navigator.pushNamed(
                    context,
                    '/post',
                    arguments: postUrl,
                  );
                },

              ),
            const SizedBox(height: 20),
            // 하단 나머지 포스트
            OtherPost(posts: filteredPosts),
          ],
        ),
      ),
    );
  }
}
