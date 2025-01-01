import 'package:defeefront/themes/app_theme.dart';
import 'package:flutter/material.dart';

class GallaryViewPost extends StatelessWidget {
  final dynamic post;
  const GallaryViewPost({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail Image
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(6),
              image: post['thumbnailUrl'] != null
                  ? DecorationImage(
                      image: NetworkImage(post['thumbnailUrl']),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: post['thumbnailUrl'] != null
                ? Image.network(
                    post['thumbnailUrl'],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/basicImg.png',
                        fit: BoxFit.cover,
                      );
                    },
                  )
                : Image.asset(
                    'assets/images/basicImg.png',
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(height: 10),
          Text(
            post['author'] ?? 'Unknown Author',
            style: DefeeTextStyles.bodySmall,
          ),
          Text(
            post['platfrom'] ?? 'Unknown Platform',
            style: DefeeTextStyles.bodySmall.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 5),
          Text(
            post['title'] ?? 'Untitled',
            style: DefeeTextStyles.bodyLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Divider(
            color: DefeeColors.grey,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
