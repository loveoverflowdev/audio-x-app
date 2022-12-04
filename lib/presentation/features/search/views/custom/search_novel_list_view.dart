import 'package:audio_x_app/presentation/features/search/cubits/search_novel_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/custom_search_bar.dart';
import '../../cubits/search_novel_list_state.dart';
import 'cell/search_novel_cell.dart';

class SearchNovelListView extends StatelessWidget {
  const SearchNovelListView({super.key});

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey('bottom-sliver-list');
    return CustomScrollView(
      primary: true,
      key: centerKey,
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Theme.of(context).backgroundColor,
          automaticallyImplyLeading: false,
          toolbarHeight: 72,
          title: CustomSearchBar(onTextChanged: (value) {}),
        ),
        BlocBuilder<SearchNovelListCubit, SearchNovelListState>(
          builder: (context, state) {
            return SliverList(
              key: centerKey,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final novel = state.novelList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SearchNovelCell(novel: novel),
                  );
                },
                childCount: state.novelList.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
