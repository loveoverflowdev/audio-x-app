import 'package:audio_x_app/presentation/features/audio/audio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../domain/entities/novel.dart';
import '../../../../../widgets/image/common_cached_image.dart';

class HomeNovelCell extends StatelessWidget {
  final Novel novel;
  const HomeNovelCell({super.key, required this.novel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/audio',
          extra: AudioListPageGoParameter(novel: novel),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 160,
            child: AspectRatio(
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
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      novel.name,
                      style: Theme.of(context).textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      novel.introduction,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
