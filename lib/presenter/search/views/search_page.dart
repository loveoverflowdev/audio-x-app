import 'package:audio_x_app/data/respositories/novel_repository.dart';
import 'package:audio_x_app/data/use_cases/get_novel_list_use_case.dart';
import 'package:audio_x_app/presenter/search/cubits/search_novel_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom/search_novel_list_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: BlocProvider(
          create: (context) => SearchNovelListCubit(
            getNovelListUseCase: GetNovelListUseCase(
              repository: NovelRepository(),
            ),
          )..getNoveList(),
          child: const SearchNovelListView(),
        ),
      ),
    );
  }
}
