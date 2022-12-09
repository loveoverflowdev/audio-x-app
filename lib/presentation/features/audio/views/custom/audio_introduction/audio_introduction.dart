import 'package:audio_x_app/presentation/widgets/image/common_cached_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../domain/entities/novel.dart';

class AudioIntroduction extends StatelessWidget {
  final Novel novel;

  const AudioIntroduction({super.key, required this.novel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 4.5 / 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CommonCacheImage(
                  imageUrl: novel.imageUrl,
                  fit: BoxFit.cover,
                  hasFullScreen: false,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    novel.name,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    novel.author,
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Expanded(
                    child: Text(
                      novel.introduction,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
