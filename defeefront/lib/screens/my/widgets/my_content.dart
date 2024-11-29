import 'package:flutter/material.dart';

class MyContent extends StatefulWidget {
  const MyContent({Key? key}) : super(key: key);

  @override
  State<MyContent> createState() => _MyContentState();
}

class _MyContentState extends State<MyContent> {
  @override
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
        children: [
          Text('My Content'),
          Text('My Content'),
        ],
      )),
    );
  }
}
