import 'package:defeefront/screens/headline/widgets/other_post.dart';
import 'package:defeefront/screens/headline/widgets/popular.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart';

class SearchResult extends StatefulWidget {
  final String results; // 검색어를 저장할 변수
  const SearchResult({super.key, required this.results}); // 생성자에서 keyword를 받음

  @override
  _SearchResult createState() => _SearchResult();
}

class _SearchResult extends State<SearchResult> {

  List<String> filteredTitles = [];
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

      // API 응답 데이터에서 검색어와 일치하는 제목만 필터링
      final allTitles = List<String>.from(response.data.map((post) {
        return post['title'] ?? '제목 없음';
      }));

      setState(() {
        filteredTitles = allTitles
            .where((title) => title.contains(widget.results))
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
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            TextField(
              controller: TextEditingController(
                  text: widget.results), // 전달받은 검색어를 텍스트 필드에 설정
              decoration: InputDecoration(
                labelText: '리액트',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
              ),
            ),

            SizedBox(height: 16.0),

            if (isLoading)
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (filteredTitles.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    '검색 결과가 없습니다.',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                ),
              )
            else
              Expanded(
                  child:ListView.builder(
                    itemCount: filteredTitles.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: ListTile(
                          title: Text(
                            filteredTitles[index],
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      );
                    }
                  )

              ),

            Popular(),
            // OtherPost(),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
