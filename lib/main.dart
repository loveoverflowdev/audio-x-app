import 'package:audio_x_app/data/respositories/novel_repository.dart';
import 'package:audio_x_app/data/use_cases/get_novel_list_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'presentation/app/app.dart';

Future<void> main() async {
  _registerRepositories();
  WidgetsBinding _ = WidgetsFlutterBinding.ensureInitialized();
  final HydratedStorage storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(
      App(),
    ),
    storage: storage,
  );
}

void _registerRepositories() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<NovelRepository>(
    NovelRepository(),
  );
}
