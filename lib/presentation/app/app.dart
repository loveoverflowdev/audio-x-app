import 'package:audio_x_app/presentation/audio/views/audio_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'views/app_frame.dart';
import 'app_theme.dart';
import 'cubits/app_cubit.dart';

class App extends StatelessWidget {
  App({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const AppFrame();
        },
      ),
      GoRoute(
        path: '/audio',
        builder: (BuildContext context, GoRouterState state) {
          return const AudioListPage();
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: defaultTheme,
        routerConfig: _router,
        title: 'Audio X demo',
      ),
    );
  }
}
