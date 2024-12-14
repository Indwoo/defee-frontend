import 'package:defeefront/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:defeefront/themes/app_theme.dart';
import 'package:defeefront/widgets/header.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Container(
        color: Theme.of(context).colorScheme.surfaceContainer,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: DefeeThemeSizes.borderRadius,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
