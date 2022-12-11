import 'package:equatable/equatable.dart';

import '../../../../domain/entities/novel.dart';

enum HomeNovelListStatus {
  pure,
  loading,
  finished,
  error,
}

class HomeNovelListState extends Equatable {
  final String title;
  final List<Novel> novelList;
  final HomeNovelListStatus status;

  const HomeNovelListState({
    this.title = '',
    this.novelList = const [],
    this.status = HomeNovelListStatus.pure,
  });

  HomeNovelListState copyWith({
    final String? title,
    final List<Novel>? novelList,
    final HomeNovelListStatus? status,
  }) =>
      HomeNovelListState(
        title: title ?? this.title,
        novelList: novelList ?? this.novelList,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [title, novelList, status];
}
