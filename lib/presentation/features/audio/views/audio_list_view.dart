import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/audio_chapter_list_cubit.dart';
import '../cubits/audio_chapter_list_state.dart';
import 'custom/tile/audio_chapter_tile.dart';

class AudioListView extends StatelessWidget {
  const AudioListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<AudioChapterListCubit, AudioChapterListState>(
          builder: (context, state) {
            final novelChapterList = state.novelChapterList;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: novelChapterList.length,
              itemBuilder: (context, index) {
                return AudioChapterTile(
                  index: index,
                  novelChapter: novelChapterList[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
