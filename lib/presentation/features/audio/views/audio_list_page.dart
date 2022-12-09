// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audio_x_app/presentation/features/audio/cubits/audio_chapter_list_cubit.dart';
import 'package:audio_x_app/presentation/features/audio/cubits/audio_chapter_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/novel.dart';
import 'audio_list_view.dart';
import 'custom/audio_introduction/audio_introduction.dart';

class AudioListPageGoParameter {
  final Novel novel;
  AudioListPageGoParameter({
    required this.novel,
  });
}

class AudioListPage extends StatelessWidget {
  const AudioListPage({
    super.key,
    required this.goParameter,
  });

  final AudioListPageGoParameter goParameter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(goParameter.novel.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(8),
            child: AudioIntroduction(
              novel: goParameter.novel,
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (context) => AudioChapterListCubit(
                getNovelChapterListUseCase: GetIt.instance(),
              )..getNovelChapterList(novelId: goParameter.novel.id),
              child: const AudioListView(),
            ),
          ),
        ],
      ),
    );
  }
}
