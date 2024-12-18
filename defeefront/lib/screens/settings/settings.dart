import 'package:defeefront/screens/settings/widget/setting_content.dart';
import 'package:flutter/material.dart';
import 'package:defeefront/themes/app_theme.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("설정")),
      body: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SettingContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
