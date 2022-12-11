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
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: BlocBuilder<AudioChapterListCubit, AudioChapterListState>(
        builder: (context, state) {
          final novelChapterList = state.novelChapterList;
          return ListView.builder(
            shrinkWrap: true,
            physics: physics,
            itemCount: novelChapterList.length,
            itemBuilder: (context, index) {
              return AudioChapterTile(
                index: index,
                novelChapter: novelChapterList[index],
                title: 'Chương $index - ${novel.name}',
              );
            },
          );
        },
      ),
    );
  }
}
