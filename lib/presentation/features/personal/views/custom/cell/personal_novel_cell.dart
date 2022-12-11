import 'package:audio_x_app/presentation/features/audio/audio.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../../domain/entities/novel.dart';
import '../../../../../widgets/image/common_cached_image.dart';

class PersonalNovelCell extends StatelessWidget {
  final Novel novel;
  final void Function() onPopAfterPush;

  static const uuid = Uuid();
  final String _imageTag = uuid.v4();
  final String _titleTag = uuid.v4();

  PersonalNovelCell({
    super.key,
    required this.novel,
    required this.onPopAfterPush,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.push(context, CupertinoPageRoute(builder: (_) {
          return AudioListPage(
            goParameter: AudioListPageGoParameter(
                novel: novel,
                imageTag: _imageTag,
                titleTag: _titleTag,
                authorTag: ''),
          );
        }));
        onPopAfterPush.call();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 160,
            child: Hero(
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
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: _titleTag,
                    child: Material(
                      type: MaterialType.transparency,
                      child: AutoSizeText(
                        novel.name,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.headline6!.color,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
