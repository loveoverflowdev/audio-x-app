import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../data/respositories/novel_repository.dart';
import '../../../../data/use_cases/get_novel_list_use_case.dart';
import '../cubits/search_novel_list_cubit.dart';
import 'custom/search_novel_list_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: BlocProvider(
        create: (context) => SearchNovelListCubit(
          getNovelListUseCase: GetNovelListUseCase(
            repository: GetIt.instance<NovelRepository>(),
          ),
        )..getNoveList(),
        child: const SearchNovelListView(),
      ),
    );
  }
}
