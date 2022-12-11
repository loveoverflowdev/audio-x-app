// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audio_x_app/data/respositories/favorite_novel_repository.dart';
import 'package:audio_x_app/presentation/widgets/loading/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:audio_x_app/presentation/widgets/image/common_cached_image.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../domain/entities/novel.dart';

class AudioHeaderTitle extends StatefulWidget {
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
  State<AudioHeaderTitle> createState() => _AudioHeaderTitleState();
}

class _AudioHeaderTitleState extends State<AudioHeaderTitle> {
  late final FavoriteNovelRepository _favoriteNovelRepository;

  @override
  void initState() {
    super.initState();
    _favoriteNovelRepository = GetIt.instance.get<FavoriteNovelRepository>();
  }

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
              tag: widget.imageTag,
              child: AspectRatio(
                aspectRatio: 4.5 / 6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CommonCacheImage(
                    imageUrl: widget.novel.imageUrl,
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
                    tag: widget.titleTag,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        widget.novel.name,
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
                    tag: widget.authorTag,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        widget.novel.author,
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
                  Expanded(
                    child: FutureBuilder(
                      future: _getLikeValue(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || snapshot.data == null) {
                          return const LoadingWidget();
                        }
                        final liked = snapshot.data!;
                        return _LikeButton(
                          liked: liked,
                          onPressed: (liked) {
                            if (liked) {
                              _favoriteNovelRepository
                                  .addFavoriteNovel(widget.novel);
                            } else {
                              _favoriteNovelRepository
                                  .removeFavoriteNovel(widget.novel);
                            }
                          },
                        );
                      },
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

  Future<bool> _getLikeValue() async {
    final novelList = await _favoriteNovelRepository.getFavoriteNovelList();
    return novelList.contains(widget.novel);
  }
}

class _LikeButton extends StatefulWidget {
  final bool liked;
  final void Function(bool) onPressed;

  const _LikeButton({
    Key? key,
    required this.onPressed,
    required this.liked,
  }) : super(key: key);

  @override
  State<_LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<_LikeButton> {
  late bool _liked;

  @override
  void initState() {
    super.initState();
    _liked = widget.liked;
  }

  @override
  Widget build(BuildContext context) {
    final icon = _liked
        ? const Icon(
            CupertinoIcons.heart_fill,
            color: Color(0xfff43f5e),
          )
        : const Icon(CupertinoIcons.heart);
    return IconButton(
      onPressed: () {
        setState(() {
          _liked = !_liked;
          widget.onPressed.call(_liked);
        });
      },
      icon: icon,
    );
  }
}
