import 'package:audio_x_app/data/use_cases/get_novel_chapter_list_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'audio_chapter_list_state.dart';

class AudioChapterListCubit extends Cubit<AudioChapterListState> {
  final GetNovelChapterListUseCase getNovelChapterListUseCase;

  AudioChapterListCubit({
    required this.getNovelChapterListUseCase,
  }) : super(const AudioChapterListState());

  void getNovelChapterList({
    required String novelId,
  }) async {
    final result = await getNovelChapterListUseCase
        .invoke(GetNovelChapterListParams(novelId: novelId));
    result.fold(
      (l) => emit(state.copyWith(
        status: AudioChapterListStatus.finished,
        novelChapterList: l.toList(),
      )),
      (r) => emit(state.copyWith(
        status: AudioChapterListStatus.error,
      )),
    );
  }
}
