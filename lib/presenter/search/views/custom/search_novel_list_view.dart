import 'package:audio_x_app/presenter/search/cubits/search_novel_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/search_novel_list_state.dart';
import 'cell/search_novel_cell.dart';

class SearchNovelListView extends StatelessWidget {
  const SearchNovelListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: 'Search...',
            floatingLabelStyle: Theme.of(context).textTheme.labelMedium,
            labelStyle: Theme.of(context).textTheme.labelMedium,
            hoverColor: Theme.of(context).primaryColor,
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.0,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.0,
              ),
            ),
            focusColor: Theme.of(context).primaryColor,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.0,
              ),
            ),
          ),
          cursorColor: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 8),
        Expanded(
          child: BlocBuilder<SearchNovelListCubit, SearchNovelListState>(
            builder: (context, state) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.novelList.length,
                itemBuilder: (context, index) {
                  final novel = state.novelList[index];
                  return SearchNovelCell(novel: novel);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
