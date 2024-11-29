import 'package:flutter/material.dart';

class MyPost extends StatelessWidget {
  final String folderName;

  MyPost({required this.folderName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(folderName),
      ),
      body: ListView.builder(
        itemCount: 10, // 예시 데이터
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('이것저것 블로그'),
            subtitle: Text('가상 메모리'),
          );
        },
      ),
    );
  }
}
