import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    String headerText;
    switch (currentRoute) {
      case '/search':
        headerText = "검색";
        break;
      case '/recommend':
        headerText = "추천";
        break;
      case '/my':
        headerText = "MY";
        break;
      default:
        headerText = "헤드라인";
    }

    return AppBar(
      centerTitle: true,
      leading: null,
      title: Text(
        headerText,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            print("알림 아이콘 클릭됨");
          },
        ),
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            print("목록 아이콘 클릭됨");
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
