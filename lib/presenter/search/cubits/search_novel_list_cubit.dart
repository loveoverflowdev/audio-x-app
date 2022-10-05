import 'package:audio_x_app/data/models/novel/novel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/use_cases/get_novel_list_use_case.dart';

class SearchNovelListState extends Equatable {
  final List<Novel> novelList;

  const SearchNovelListState({
    this.novelList = const [],
  });

  SearchNovelListState copyWith({
    List<Novel>? novelList,
  }) =>
      SearchNovelListState(
        novelList: novelList ?? this.novelList,
      );

  @override
  List<Object?> get props => [...novelList];
}

class SearchNovelListCubit extends Cubit<SearchNovelListState> {
  final GetNovelListUseCase _getNovelListUseCase;
  SearchNovelListCubit({
    required GetNovelListUseCase getNovelListUseCase,
  })  : _getNovelListUseCase = getNovelListUseCase,
        super(const SearchNovelListState());

  void getNoveList() async {
    final result = await _getNovelListUseCase.invoke();
    result.fold(
      (l) {
        emit(state.copyWith(novelList: l));
      },
      (r) {},
    );
  }
}
