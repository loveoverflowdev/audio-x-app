import 'package:audio_x_app/presentation/features/audio/audio.dart';
import 'package:audio_x_app/presentation/widgets/image/common_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../domain/entities/novel.dart';

class SearchNovelCell extends StatelessWidget {
  final Novel novel;

  static const uuid = Uuid();
  final String _imageTag = uuid.v4();
  final String _titleTag = uuid.v4();
  final String _authorTag = uuid.v4();

  SearchNovelCell({super.key, required this.novel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        context.push(
          '/audio',
          extra: AudioListPageGoParameter(
            novel: novel,
            imageTag: _imageTag,
            authorTag: _authorTag,
            titleTag: _titleTag,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          height: 148,
          child: Row(
            children: [
              Hero(
                tag: _imageTag,
                child: AspectRatio(
                  aspectRatio: 4.5 / 6,
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
                    Hero(
                      tag: _titleTag,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          novel.name,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline6!.color,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Hero(
                      tag: _authorTag,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          novel.author,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Expanded(
                      child: Text(
                        novel.introduction,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Theme.of(context).textTheme.caption!.color,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
