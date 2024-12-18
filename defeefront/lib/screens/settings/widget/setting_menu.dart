import 'package:flutter/material.dart';
import 'package:defeefront/themes/app_theme.dart';

class SettingMenu extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> menuItems; // Map 구조로 변경

  SettingMenu({required this.title, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(title, style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: DefeeThemeSizes.primaryBorderRadius,
          ),
          child: Column(
            children: menuItems
                .map((menuItem) => Column(
                      children: [
                        ListTile(
                          title: Text(
                            menuItem['title'],
                            style: DefeeTextStyles.onPrimaryLarge,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios,
                              color: Theme.of(context).colorScheme.onPrimary),
                          onTap: menuItem['onTap'], // 각 메뉴의 onTap 함수 실행
                        ),
                        if (menuItems.indexOf(menuItem) != menuItems.length - 1)
                          Divider(),
                      ],
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
