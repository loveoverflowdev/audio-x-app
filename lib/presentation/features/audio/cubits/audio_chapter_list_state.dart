// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:audio_x_app/domain/entities/novel_chapter.dart';

enum AudioChapterListStatus {
  pure,
  finished,
  loading,
  error,
}

class AudioChapterListState extends Equatable {
  // TODO: add error message
  final AudioChapterListStatus status;
  final List<NovelChapter> novelChapterList;

  const AudioChapterListState({
    this.status = AudioChapterListStatus.pure,
    this.novelChapterList = const [],
  });

  @override
  List<Object> get props => [status, novelChapterList];

  AudioChapterListState copyWith({
    AudioChapterListStatus? status,
    List<NovelChapter>? novelChapterList,
  }) {
    return AudioChapterListState(
      status: status ?? this.status,
      novelChapterList: novelChapterList ?? this.novelChapterList,
    );
  }
}
