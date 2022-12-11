// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/entities/novel.dart';
import '../cubits/audio_chapter_list_cubit.dart';
import 'audio_list_view.dart';
import 'custom/audio_header_title/audio_header_title.dart';

class AudioListPageGoParameter {
  final Novel novel;
  final String imageTag;
  final String titleTag;
  final String authorTag;

  AudioListPageGoParameter({
    required this.novel,
    required this.imageTag,
    required this.titleTag,
    required this.authorTag,
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
        centerTitle: true,
        title: Text(goParameter.novel.name),
      ),
      body: ListView(
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AudioHeaderTitle(
            novel: goParameter.novel,
            authorTag: goParameter.authorTag,
            imageTag: goParameter.imageTag,
            titleTag: goParameter.titleTag,
          ),
          const SizedBox(height: 24),
          _buildSectionTitle(context, title: 'Tóm lược'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              goParameter.novel.introduction,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
                color: Colors.grey,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle(context, title: 'Danh sách chương'),
          BlocProvider(
            create: (context) => AudioChapterListCubit(
              getNovelChapterListUseCase: GetIt.instance(),
            )..getNovelChapterList(novelId: goParameter.novel.id),
            child: AudioListView(
              physics: const NeverScrollableScrollPhysics(),
              novel: goParameter.novel,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(
    BuildContext context, {
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: IntrinsicHeight(
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
            ),
          ],
        ),
      ),
    );
  }
}
