import 'package:audio_x_app/core/network/network_client.dart';
import 'package:audio_x_app/data/network/request/rest_client.dart';
import 'package:audio_x_app/data/respositories/novel_chapter_repository.dart';
import 'package:audio_x_app/data/respositories/novel_repository.dart';
import 'package:audio_x_app/data/use_cases/get_novel_chapter_list_use_case.dart';
import 'package:audio_x_app/data/use_cases/get_novel_list_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import 'data/respositories/favorite_novel_repository.dart';
import 'data/respositories/novel_history_repository.dart';
import 'presentation/app/app.dart';

Future<void> main() async {
  WidgetsBinding _ = WidgetsFlutterBinding.ensureInitialized();
  final HydratedStorage storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  _registerRepositories(storage: storage);
  _registerUseCases();
  HydratedBlocOverrides.runZoned(
    () => runApp(
      App(),
    ),
    storage: storage,
  );
}

void _registerRepositories({
  required HydratedStorage storage,
}) {
  final logger = kDebugMode ? Logger() : null;
  final NetworkClient networkClient = RestClient(logger: logger);
  final getIt = GetIt.instance;
  getIt.registerSingleton<NovelRepository>(NovelRepository(
    networkClient: networkClient,
  ));
  getIt.registerSingleton<NovelChapterRepository>(NovelChapterRepository(
    networkClient: networkClient,
  ));
  getIt.registerSingleton<FavoriteNovelRepository>(FavoriteNovelRepository(
    storage: storage,
  ));
  getIt.registerSingleton<NovelHistoryRepository>(NovelHistoryRepository(
    storage: storage,
  ));
}

void _registerUseCases() {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton(
    () => GetNovelListUseCase(
      repository: getIt<NovelRepository>(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetNovelChapterListUseCase(
      repository: getIt<NovelChapterRepository>(),
    ),
  );
}
