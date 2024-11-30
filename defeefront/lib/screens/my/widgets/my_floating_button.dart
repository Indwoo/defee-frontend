import 'package:flutter/material.dart';

class MyFloatingButton extends StatefulWidget {
  const MyFloatingButton({super.key});

  @override
  State<MyFloatingButton> createState() => _MyFloatingButtonState();
}

class _MyFloatingButtonState extends State<MyFloatingButton> {
  static const List<(Color?, Color? background, ShapeBorder?)> customizations =
      <(Color?, Color?, ShapeBorder?)>[
    (null, null, null),
    (Colors.white, Colors.blue, null),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          index = (index + 1) % customizations.length;
        });
        print("플로팅 버튼 클릭");
      },
      foregroundColor: customizations[index].$1,
      backgroundColor: customizations[index].$2,
      shape: customizations[index].$3,
      child: const Icon(Icons.add),
    );
  }
}
