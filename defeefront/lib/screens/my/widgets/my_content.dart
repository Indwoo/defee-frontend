import 'package:flutter/material.dart';
import 'package:defeefront/screens/my/widgets/my_menu.dart';
import 'package:defeefront/screens/my/widgets/my_post.dart';

class MyContent extends StatefulWidget {
  const MyContent({Key? key}) : super(key: key);

  @override
  State<MyContent> createState() => _MyContentState();
}

class _MyContentState extends State<MyContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MyMenu(
              title: "스크랩",
              items: [
                MyMenuItem(title: "저장", isFolder: true),
                MyMenuItem(title: "자료구조", isFolder: true),
                MyMenuItem(title: "면접", isFolder: true),
              ],
              onPressed: (title, isFolder) {
                if (isFolder) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyPost(folderName: title),
                    ),
                  );
                } else {
                  // 키워드 검색 로직 추가
                  print("키워드 $title 검색 실행");
                }
              },
            ),
            SizedBox(height: 16),
            MyMenu(
              title: "키워드",
              items: [
                MyMenuItem(title: "AWS", isFolder: false),
                MyMenuItem(title: "Python", isFolder: false),
                MyMenuItem(title: "React", isFolder: false),
                MyMenuItem(title: "AWS", isFolder: false),
                MyMenuItem(title: "Python", isFolder: false),
                MyMenuItem(title: "React", isFolder: false),
                MyMenuItem(title: "AWS", isFolder: false),
                MyMenuItem(title: "Python", isFolder: false),
                MyMenuItem(title: "React", isFolder: false),
              ],
              onPressed: (title, isFolder) {
                if (isFolder) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyPost(folderName: title),
                    ),
                  );
                } else {
                  // 키워드 검색 로직 추가
                  print("키워드 $title 검색 실행");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
