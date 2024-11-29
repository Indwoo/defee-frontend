import 'package:flutter/material.dart';

class MyMenu extends StatelessWidget {
  final String title;
  final List<MyMenuItem> items;
  final Function(String title, bool isFolder)? onPressed;

  MyMenu({required this.title, required this.items, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 제목
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // 아이템 그리드
        Container(
          decoration: BoxDecoration(
            color: Color(0xff002686),
            borderRadius: BorderRadius.circular(10),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              // mainAxisSpacing: 12,
              // crossAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: () {
                  if (onPressed != null) {
                    onPressed!(item.title, item.isFolder);
                  }
                },
                child: _buildMenuItem(item),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(MyMenuItem item) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 아이콘 또는 글자
        Container(
          width: 50,
          height: 50,
          child: Center(
            child: item.isFolder
                ? Icon(
                    Icons.folder,
                    color: Colors.white,
                    size: 36,
                  )
                : Text(
                    item.title.substring(0, 1).toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
        Text(
          item.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 10, color: Colors.white),
        ),
      ],
    );
  }
}

// 메뉴 아이템 모델
class MyMenuItem {
  final String title;
  final bool isFolder;

  MyMenuItem({required this.title, required this.isFolder});
}
