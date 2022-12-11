// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:audio_x_app/presentation/widgets/image/common_cached_image.dart';

import '../../../../../../domain/entities/novel.dart';

class AudioHeaderTitle extends StatelessWidget {
  final Novel novel;
  final String imageTag;
  final String titleTag;
  final String authorTag;

  const AudioHeaderTitle({
    Key? key,
    required this.novel,
    required this.imageTag,
    required this.titleTag,
    required this.authorTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      child: SizedBox(
        height: 160,
        child: Row(
          children: [
            Hero(
              tag: imageTag,
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
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: titleTag,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        novel.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: theme.textTheme.headline6!.color,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ),
                  Hero(
                    tag: authorTag,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        novel.author,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
    BuildContext context, {
    required String title,
  }) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).textTheme.caption!.color,
          )
        ],
      ),
    );
  }
}
