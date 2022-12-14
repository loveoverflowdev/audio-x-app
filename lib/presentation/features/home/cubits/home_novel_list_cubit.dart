import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/use_cases/get_novel_list_use_case.dart';
import 'home_novel_list_state.dart';

class HomeNovelListCubit extends Cubit<HomeNovelListState> {
  final GetNovelListUseCase _getNovelListUseCase;
  HomeNovelListCubit({
    required GetNovelListUseCase getNovelListUseCase,
  })  : _getNovelListUseCase = getNovelListUseCase,
        super(const HomeNovelListState());

  @override
  void emit(HomeNovelListState state) {
    if (!isClosed) super.emit(state);
  }

  void getNovelList({
    required String title,
    required String tag,
  }) async {
    emit(state.copyWith(status: HomeNovelListStatus.loading));
    final result =
        await _getNovelListUseCase.invoke(GetNovelListParams(searchText: tag));
    result.fold(
      (l) {
        emit(state.copyWith(
          novelList: l.toList(),
          title: title,
          status: HomeNovelListStatus.finished,
        ));
      },
      (r) {
        emit(state.copyWith(
          status: HomeNovelListStatus.error,
        ));
      },
    );
  }
}
