import 'package:audio_x_app/presentation/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/novel.dart';
import '../cubits/audio_chapter_list_cubit.dart';
import '../cubits/audio_chapter_list_state.dart';
import 'custom/tile/audio_chapter_tile.dart';

class AudioListView extends StatelessWidget {
  final Novel novel;

  final ScrollPhysics? physics;

  const AudioListView({
    Key? key,
    this.physics,
    required this.novel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: BlocBuilder<AudioChapterListCubit, AudioChapterListState>(
        builder: (context, state) {
          if (state.status == AudioChapterListStatus.loading) {
            return const LoadingWidget();
          }
          final novelChapterList = state.novelChapterList;
          return ListView.builder(
            shrinkWrap: true,
            physics: physics,
            itemCount: novelChapterList.length,
            itemBuilder: (context, index) {
              final chapterIndex = index + 1;
              return AudioChapterTile(
                index: chapterIndex,
                novelChapter: novelChapterList[index],
                title: 'Chương $chapterIndex - ${novel.name}',
                imageUrl: novel.imageUrl,
                novel: novel,
              );
            },
          );
        },
      ),
    );
  }
}
