import 'package:flutter/material.dart';
import 'package:defeefront/screens/settings/settings.dart';

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
      case '/settings':
        headerText = "설정";
        break;
      default:
        headerText = "헤드라인";
    }

    return AppBar(
      centerTitle: true,
      leading: Container(),
      title: Text(
        headerText,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
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
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
