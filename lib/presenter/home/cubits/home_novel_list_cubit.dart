import 'package:audio_x_app/data/use_cases/get_novel_list_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_novel_list_state.dart';

class HomeNovelListCubit extends Cubit<HomeNovelListState> {
  final GetNovelListUseCase _getNovelListUseCase;
  HomeNovelListCubit({
    required GetNovelListUseCase getNovelListUseCase,
  })  : _getNovelListUseCase = getNovelListUseCase,
        super(const HomeNovelListState());

  void getNovelList({
    required String title,
  }) async {
    final result = await _getNovelListUseCase.invoke();
    result.fold(
      (l) {
        emit(state.copyWith(novelList: l, title: title));
      },
      (r) {},
    );
  }
}
