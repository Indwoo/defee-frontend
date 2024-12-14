import 'package:defeefront/screens/settings/widget/setting_menu.dart';
import 'package:flutter/material.dart';
import 'package:defeefront/themes/app_theme.dart';

class SettingContent extends StatelessWidget {
  const SettingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          SettingMenu(title: "계정", menuItems: ["닉네임 변경", "블로그 변경"]),
          SettingMenu(title: "시스템 설정", menuItems: ["알림 설정", "다크/라이트모드 설정"]),
          SettingMenu(title: "기타", menuItems: ["문의 및 피드백", "앱 공유하기"]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text("버전 1.0.0 | 로그아웃",
                  style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 8),
              Text("개인정보 처리방침 | 이용약관",
                  style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
