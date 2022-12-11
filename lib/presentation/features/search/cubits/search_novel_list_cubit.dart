import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_novel_list_state.dart';
import '../../../../data/use_cases/get_novel_list_use_case.dart';

class SearchNovelListCubit extends Cubit<SearchNovelListState> {
  final GetNovelListUseCase _getNovelListUseCase;
  SearchNovelListCubit({
    required GetNovelListUseCase getNovelListUseCase,
  })  : _getNovelListUseCase = getNovelListUseCase,
        super(const SearchNovelListState());

  void getNoveList({
    required String searchText,
  }) async {
    emit(state.copyWith(status: SearchNovelListStatus.loading));
    final result = await _getNovelListUseCase
        .invoke(GetNovelListParams(searchText: searchText));
    result.fold(
      (l) {
        emit(state.copyWith(
          novelList: l.toList(),
          status: SearchNovelListStatus.finished,
        ));
      },
      (r) {
        emit(state.copyWith(
          status: SearchNovelListStatus.error,
        ));
      },
    );
  }
}
