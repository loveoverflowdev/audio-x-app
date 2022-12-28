import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../domain/entities/novel.dart';

class NovelHistoryRepository {
  static const _novelListKey = 'NovelHistoryRepository._novelListKey';

  final HydratedStorage _storage;

  NovelHistoryRepository({
    required HydratedStorage storage,
  }) : _storage = storage;

  Future<List<Novel>> getRecentNovelList() async {
    final data = await _storage.read(_novelListKey);
    final Iterable novelList = data is Iterable ? data : [];
    return novelList.map((e) => Novel.fromMap(Map.from(e))).toList();
  }

  Future<void> addOrUpdateRecentNovel(Novel novel) async {
    final novelList = await getRecentNovelList();
    if (!novelList.contains(novel)) {
      novelList.add(novel);
    } else {
      final index = novelList.indexOf(novel);
      if (index != -1) novelList[index] = novel;
    }
    return _saveNovelList(novelList);
  }

  Future<bool> removeRecentNovel(Novel novel) async {
    final novelList = await getRecentNovelList();
    final result = novelList.remove(novel);
    _saveNovelList(novelList);
    return result;
  }

  Future<void> _saveNovelList(List<Novel> novelList) {
    return _storage.write(
      _novelListKey,
      novelList.map((e) => e.toMap()).toList(),
    );
  }
}
