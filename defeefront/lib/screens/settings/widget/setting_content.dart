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
          SettingMenu(
            title: "계정",
            menuItems: [
              {
                'title': '닉네임 변경',
                'onTap': () =>
                    {print('닉네임 변경 클릭'), Navigator.pushNamed(context, '/login')}
              },
              {'title': '블로그 변경', 'onTap': () => print('블로그 변경 클릭')},
            ],
          ),
          SettingMenu(
            title: "시스템 설정",
            menuItems: [
              {
                'title': '알림 설정',
                'onTap': () => print('알림 설정 클릭'),
                // 'onTap': () => Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationSettingsPage())),
              },
              {
                'title': '다크/라이트모드 설정',
                'onTap': () => print('다크/라이트모드 설정 클릭'),
              },
            ],
          ),
          SettingMenu(
            title: "기타",
            menuItems: [
              {
                'title': '문의 및 피드백',
                'onTap': () => print('문의 및 피드백 클릭'),
                // 'onTap': () => Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackPage())),
              },
              {
                'title': '앱 공유하기',
                'onTap': () {
                  print('앱 공유하기 클릭');
                },
              },
            ],
          ),
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
