import 'package:audio_x_app/data/use_cases/get_novel_list_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/novel/novel.dart';

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

class HomeNovelListState extends Equatable {
  final String title;
  final List<Novel> novelList;

  const HomeNovelListState({
    this.title = '',
    this.novelList = const [],
  });

  HomeNovelListState copyWith({
    final String? title,
    final List<Novel>? novelList,
  }) =>
      HomeNovelListState(
        title: title ?? this.title,
        novelList: novelList ?? this.novelList,
      );

  @override
  List<Object?> get props => [title, ...novelList];
}
