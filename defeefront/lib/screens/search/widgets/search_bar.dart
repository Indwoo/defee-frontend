import 'package:flutter/material.dart';

class MainSearchBar extends StatefulWidget {
  const MainSearchBar({super.key});

  @override
  _MainSearchBarState createState() => _MainSearchBarState();
}

class _MainSearchBarState extends State<MainSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller, // TextEditingController 연결
      decoration: InputDecoration(
        labelText: '검색',
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            _controller.clear(); // TextField 내용 지우기
          },
        ),
      ),
    );
  }
}