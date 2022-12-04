import 'package:equatable/equatable.dart';

import '../../../data/models/novel/novel.dart';

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
