import 'package:defeefront/widgets/footer.dart';
import 'package:defeefront/widgets/header.dart';
import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  const Headline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: Text("테스트"),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
