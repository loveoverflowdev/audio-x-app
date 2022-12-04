import 'package:equatable/equatable.dart';

import '../../../../domain/entities/novel.dart';

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
