import 'package:audio_x_app/presentation/features/search/cubits/search_novel_list_cubit.dart';
import 'package:audio_x_app/presentation/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/custom_search_bar.dart';
import '../../cubits/search_novel_list_state.dart';
import 'cell/search_novel_cell.dart';

class SearchNovelListView extends StatelessWidget {
  const SearchNovelListView({super.key});

  void _onSearchNovel(
    BuildContext context, {
    required String text,
  }) {
    context.read<SearchNovelListCubit>().getNoveList(searchText: text);
  }

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey('bottom-sliver-list');
    return RefreshIndicator(
      onRefresh: () async => _onSearchNovel(context, text: ''),
      child: CustomScrollView(
        primary: true,
        key: centerKey,
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Theme.of(context).backgroundColor,
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: CustomSearchBar(
              onTextChanged: (value) => _onSearchNovel(context, text: value),
            ),
          ),
          BlocBuilder<SearchNovelListCubit, SearchNovelListState>(
            builder: (context, state) {
              return SliverVisibility(
                replacementSliver: const SliverToBoxAdapter(
                  child: LoadingWidget(),
                ),
                visible: state.status != SearchNovelListStatus.loading,
                sliver: SliverList(
                  key: centerKey,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final novel = state.novelList[index];
                      return SearchNovelCell(novel: novel);
                    },
                    childCount: state.novelList.length,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
