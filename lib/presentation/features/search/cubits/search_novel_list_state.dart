import 'package:equatable/equatable.dart';

import '../../../../domain/entities/novel.dart';

enum SearchNovelListStatus {
  pure,
  loading,
  finished,
  error,
}

class SearchNovelListState extends Equatable {
  final List<Novel> novelList;
  final SearchNovelListStatus status;

  const SearchNovelListState({
    this.novelList = const [],
    this.status = SearchNovelListStatus.pure,
  });

  SearchNovelListState copyWith({
    List<Novel>? novelList,
    SearchNovelListStatus? status,
  }) =>
      SearchNovelListState(
        novelList: novelList ?? this.novelList,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [novelList, status];
}
