import 'package:audio_x_app/data/respositories/novel_repository.dart';
import 'package:audio_x_app/data/use_cases/get_novel_list_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../cubits/home_novel_list_cubit.dart';
import 'custom/home_novel_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Trang chủ'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Builder(builder: (context) {
          final hotNovelCubit = HomeNovelListCubit(
            getNovelListUseCase: GetIt.instance<GetNovelListUseCase>(),
          )..getNovelList(title: 'Truyện Hot');
          final recommendNovelCubit = HomeNovelListCubit(
            getNovelListUseCase: GetIt.instance<GetNovelListUseCase>(),
          )..getNovelList(title: 'Truyện Phổ Biến');
          return RefreshIndicator(
            onRefresh: () async {
              hotNovelCubit.getNovelList(title: 'Truyện Hot');
              recommendNovelCubit.getNovelList(title: 'Truyện Phổ Biến');
            },
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                BlocProvider(
                  create: (context) => hotNovelCubit,
                  child: const HomeNovelGridView(),
                ),
                const SizedBox(height: 24),
                BlocProvider(
                  create: (context) => recommendNovelCubit,
                  child: const HomeNovelGridView(),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
