import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../domain/entities/novel.dart';

class FavoriteNovelRepository {
  static const _novelListKey = 'FavoriteNovelRepository._novelListKey';

  final HydratedStorage _storage;

  FavoriteNovelRepository({
    required HydratedStorage storage,
  }) : _storage = storage;

  Future<List<Novel>> getFavoriteNovelList() async {
    final data = await _storage.read(_novelListKey);
    final Iterable novelList = data is Iterable ? data : [];
    return novelList.map((e) => Novel.fromMap(Map.from(e))).toList();
  }

  Future<void> addFavoriteNovel(Novel novel) async {
    final novelList = await getFavoriteNovelList();
    novelList.add(novel);
    return _saveNovelList(novelList);
  }

  Future<bool> removeFavoriteNovel(Novel novel) async {
    final novelList = await getFavoriteNovelList();
    final result = novelList.remove(novel);
    _saveNovelList(novelList);
    return result;
  }

  Future<void> _saveNovelList(List<Novel> novelList) {
    return _storage.write(
        _novelListKey, novelList.map((e) => e.toMap()).toList());
  }
}
