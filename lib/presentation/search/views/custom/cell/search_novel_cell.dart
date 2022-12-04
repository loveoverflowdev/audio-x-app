import 'package:audio_x_app/data/models/novel/novel.dart';
import 'package:audio_x_app/presentation/audio/views/audio_listener_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchNovelCell extends StatelessWidget {
  final Novel novel;

  const SearchNovelCell({super.key, required this.novel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return const AudioListenerPage();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 4.5 / 6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CachedNetworkImage(
                    imageUrl: novel.imageUrl,
                    fit: BoxFit.cover,
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
      ),
    );
  }
}
