import 'package:audio_x_app/presentation/features/home/cubits/home_novel_list_cubit.dart';
import 'package:audio_x_app/presentation/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/home_novel_list_state.dart';
import 'cell/home_novel_cell.dart';

class HomeNovelGridView extends StatelessWidget {
  const HomeNovelGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNovelListCubit, HomeNovelListState>(
      builder: (context, state) {
        if (state.status == HomeNovelListStatus.loading) {
          return const SizedBox(
            height: 100,
            child: Center(child: LoadingWidget()),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                state.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 0,
                childAspectRatio: 1 / 2,
              ),
              itemCount: state.novelList.length,
              itemBuilder: (BuildContext context, int index) {
                final novel = state.novelList[index];
                return HomeNovelCell(
                  novel: novel,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
