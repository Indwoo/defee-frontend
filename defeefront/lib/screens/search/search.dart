import 'package:defeefront/screens/search/widgets/search_history.dart';
import 'package:defeefront/themes/app_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart';
import '../../screens/search/widgets/search_bar.dart';
import '../search_result/search_result.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String? selectedKeyword; //인기 키워드 선택 여부
  String? selectedMyKeyword; //내 키워드 선택 여부
  bool showPopularKeywords = false; // 인기 키워드 칩 표시 여부
  bool showMyKeywords = false; // 내 키워드 칩 표시 여부
  bool isLoading = true; // API 데이터 로딩 상태

  List<String> popularKeywords = [];
  List<String> myKeywords = [];
  List<String> titles = [];

  final GlobalKey<MainSearchBarState> searchBarKey =
      GlobalKey<MainSearchBarState>();

  @override
  void initState() {
    super.initState();
    fetchTitles();
  }

  Future<void> fetchTitles() async {
    try {
      Dio dio = Dio();
      final response = await dio.get('http://localhost:8080/api/posts');

      setState(() {
        titles = response.data
            .map<String>((post) => post['title'] ?? '제목 없음')
            .toList();
        isLoading = false; // 로딩 상태 해제
      });
    } catch (e) {
      print('Error fetching titles: $e');
      setState(() {
        isLoading = false; // 로딩 상태 해제
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //상단 검색 바
            MainSearchBar(
              key: searchBarKey, // GlobalKey 설정
              onKeywordSelected: (keyword) {
                // 검색어가 선택되면 검색 결과 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SearchResult(keyword: keyword), // 검색어를 SearchResult로 전달
                  ),
                );
              },
            ),

            SizedBox(height: 16.0),

            // 인기 키워드 드롭다운
            GestureDetector(
              onTap: () {
                setState(() {
                  showPopularKeywords = !showPopularKeywords; // 클릭 시 표시 여부 토글
                });
              },
              child: Container(
                padding: DefeeThemeSizes.thickPadding,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: DefeeThemeSizes.primaryBorderRadius,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '인기 키워드',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    Icon(Icons.arrow_drop_down,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200), // 애니메이션 지속 시간
              curve: Curves.easeInOut, // 애니메이션 곡선
              child: Container(
                height: showPopularKeywords ? null : 0, // 높이 설정
                child: showPopularKeywords
                    ? Column(
                        // Column을 사용하여 칩과 빈 공간을 정렬
                        children: [
                          SizedBox(height: 8.0), // 위쪽 빈 공간 추가
                          Wrap(
                            spacing: 15.0, // 칩 수평 간격
                            runSpacing: 12.0, // 칩 수직 간격
                            children: [
                              ...popularKeywords.map((keyword) {
                                bool isSelected =
                                    selectedKeyword == keyword; // 클릭된 키워드 확인
                                return GestureDetector(
                                  onTap: () {
                                    // 클릭 시 검색바에 키워드 설정
                                    searchBarKey.currentState
                                        ?.setKeyword(keyword);
                                    setState(() {
                                      selectedKeyword = keyword; // 선택된 키워드 업데이트
                                    });
                                  },
                                  child: Chip(
                                    label: Text(
                                      keyword,
                                      style: DefeeTextStyles.onSurfaceSmall,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 10.0), // 패딩 조정
                                    backgroundColor: isSelected
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context)
                                            .colorScheme
                                            .surfaceContainer, // 칩 배경색
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          DefeeThemeSizes.chipBorderRadius,
                                      // 모서리 둥글게
                                      side: BorderSide.none, // 외곽선 제거
                                    ),
                                  ),
                                );
                              }).toList(),
                              IconButton(
                                icon: Icon(Icons.add,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                // '+' 아이콘
                                onPressed: () {
                                  // TODO: '+' 아이콘 클릭
                                },
                                color: Theme.of(context).colorScheme.primary,
                                // 아이콘 배경색
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 10.0),
                                // 패딩 조정
                                constraints: BoxConstraints(), // 크기 조정
                              ),
                            ],
                          ),
                        ],
                      )
                    : SizedBox.shrink(), // 표시하지 않을 때 빈 공간을 차지하지 않도록
              ),
            ),

            SizedBox(height: 16.0),

            // 내 키워드
            GestureDetector(
              onTap: () {
                setState(() {
                  showMyKeywords = !showMyKeywords; // 클릭 시 표시 여부 토글
                });
              },
              child: Container(
                padding: DefeeThemeSizes.thickPadding,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: DefeeThemeSizes.primaryBorderRadius,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '내 키워드',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    Icon(Icons.arrow_drop_down, color: DefeeColors.white),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200), // 애니메이션 지속 시간
              curve: Curves.easeInOut, // 애니메이션 곡선
              child: Container(
                height: showMyKeywords ? null : 0, // 높이 설정
                child: showMyKeywords
                    ? Column(
                        // Column을 사용하여 칩과 빈 공간을 정렬
                        children: [
                          SizedBox(height: 8.0), // 위쪽 빈 공간 추가
                          Wrap(
                            spacing: 15.0, // 칩 수평 간격
                            runSpacing: 12.0, // 칩 수직 간격
                            children: [
                              ...myKeywords.map((keyword) {
                                return GestureDetector(
                                  onTap: () {
                                    // 클릭 시 검색바에 키워드 설정
                                    searchBarKey.currentState
                                        ?.setKeyword(keyword);
                                  },
                                  child: Chip(
                                    label: Text(
                                      keyword,
                                      style: DefeeTextStyles.onSurfaceSmall,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 10.0), // 패딩 조정
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .surfaceContainer, // 칩 배경색
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          DefeeThemeSizes.chipBorderRadius,
                                      // 모서리 둥글게
                                      side: BorderSide.none, // 외곽선 제거
                                    ),
                                  ),
                                );
                              }).toList(),
                              IconButton(
                                icon: Icon(Icons.add, color: Color(0xff002686)),
                                // '+' 아이콘
                                onPressed: () {
                                  // TODO: '+' 아이콘 클릭
                                },
                                color: Color(0xff002686),
                                // 아이콘 배경색
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 10.0),
                                // 패딩 조정
                                constraints: BoxConstraints(), // 크기 조정
                              ),
                            ],
                          ),
                        ],
                      )
                    : SizedBox.shrink(), // 표시하지 않을 때 빈 공간을 차지하지 않도록
              ),
            ),

            SizedBox(height: 16.0),

            Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),

            SizedBox(height: 16.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '기록',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // TBD : 전체 삭제 버튼 클릭
                  },
                  child: Text(
                    '전체 삭제',
                    style: TextStyle(color: Colors.grey), // 색상
                  ),
                ),
              ],
            ),

            SearchHistory(),

            Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),

            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        titles[index],
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
