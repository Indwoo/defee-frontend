import 'package:flutter/material.dart';
import 'package:defeefront/widgets/footer.dart';
import 'package:defeefront/widgets/header.dart';
import 'package:defeefront/screens/my/widgets/my_floating_button.dart';
import 'package:defeefront/screens/my/widgets/my_content.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: const MyContent(),
      floatingActionButton: const MyFloatingButton(),
      bottomNavigationBar: Footer(),
    );
  }
}
