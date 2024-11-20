import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    String? currentRoute = ModalRoute.of(context)?.settings.name;

    return Container(
      color: Colors.grey[850],
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            Icons.search,
            "검색",
            context,
            '/search',
            isSelected: currentRoute == '/search',
          ),
          _buildNavItem(
            Icons.language,
            "헤드라인",
            context,
            '/',
            isSelected: currentRoute == '/',
          ),
          _buildNavItem(
            Icons.thumb_up_outlined,
            "추천",
            context,
            '/recommend',
            isSelected: currentRoute == '/recommend',
          ),
          _buildNavItem(
            Icons.star_border,
            "My",
            context,
            '/my',
            isSelected: currentRoute == '/my',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    BuildContext context,
    String route, {
    bool isSelected = false,
  }) {
    bool isHovered = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, route);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 25),
              decoration: (isSelected || isHovered)
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white38,
                    )
                  : null,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: 20,
                    color: (isSelected || isHovered)
                        ? Colors.white
                        : Colors.white70,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      color: (isSelected || isHovered)
                          ? Colors.white
                          : Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
