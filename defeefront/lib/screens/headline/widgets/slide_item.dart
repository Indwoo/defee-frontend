import 'package:flutter/material.dart';
import 'package:defeefront/themes/app_theme.dart';

class SlideItem extends StatelessWidget {
  final dynamic post;
  const SlideItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    print(post['platform']);

    return Container(
      width: 380,
      margin: const EdgeInsets.only(right: 20),
      padding: DefeeThemeSizes.thickPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                post['author'] ?? "Unknown Author",
                style: DefeeTextStyles.onSurfaceMedium,
              ),
              const SizedBox(width: 5),
              Image(
                width: 20,
                image: AssetImage(_getPlatformIcon(post['platfrom'])),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            post['title'] ?? "Untitled",
            style: DefeeTextStyles.onSurfaceSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // 플랫폼 아이콘 변경
  String _getPlatformIcon(String? platform) {
    switch (platform) {
      case 'VELOG':
        return "assets/images/velogIcon.png";
      case 'GITHUB':
        return "assets/images/githubIcon.png";
      case 'TISTORY':
        return "assets/images/tistoryIcon.png";
      default:
        return "assets/images/defeeIcon.png";
    }
  }
}
