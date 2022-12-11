import 'package:audio_x_app/presentation/features/audio/views/audio_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/theme_config.dart';
import 'views/app_frame.dart';

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
          final parameter = state.extra as AudioListPageGoParameter;
          return AudioListPage(goParameter: parameter);
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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeData(ThemeConfig.darkTheme),
      darkTheme: themeData(ThemeConfig.darkTheme),
      routerConfig: _router,
      title: 'Audio X demo',
    );
  }

  // Apply font to our app's theme
  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(
        theme.textTheme,
      ),
      colorScheme: theme.colorScheme.copyWith(
        secondary: ThemeConfig.lightAccent,
      ),
    );
  }
}
