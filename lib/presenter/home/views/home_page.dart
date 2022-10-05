import 'package:audio_x_app/data/respositories/novel_repository.dart';
import 'package:audio_x_app/data/use_cases/get_novel_list_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/home_novel_list_cubit.dart';
import 'custom/home_novel_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              BlocProvider(
                create: (context) => HomeNovelListCubit(
                  getNovelListUseCase: GetNovelListUseCase(
                    repository: NovelRepository(),
                  ),
                )..getNovelList(title: 'Novel List'),
                child: const HomeNovelGridView(),
              ),
              const SizedBox(height: 16),
              BlocProvider(
                create: (context) => HomeNovelListCubit(
                  getNovelListUseCase: GetNovelListUseCase(
                    repository: NovelRepository(),
                  ),
                )..getNovelList(title: 'Novel List'),
                child: const HomeNovelGridView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
