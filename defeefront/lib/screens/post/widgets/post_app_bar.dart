import 'package:flutter/material.dart';

// AppBar 컴포넌트
class PostAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String url;

  const PostAppBar({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Row(
        children: [
          // URL 영역
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              decoration: BoxDecoration(
                color: Colors.grey[300], // 배경색
                borderRadius: BorderRadius.circular(12.0), // 둥근 모서리
              ),
              child: Text(
                url,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(width: 8), // URL과 아이콘 간의 간격

          // 공유 아이콘
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // 공유 로직
            },
          ),

          // 북마크 아이콘
          IconButton(
            icon: const Icon(Icons.bookmark_outline),
            onPressed: () {
              // 북마크 로직
            },
          ),

          // AI 아이콘과 텍스트
          Column(
            mainAxisSize: MainAxisSize.min, // 자식 크기만큼만 사용
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/icons/cpu.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  // AI 요약 로직
                },
              ),
              Transform.translate(
                offset: const Offset(0, -10), // 텍스트를 위로 이동
                child: const Text(
                  'AI',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
