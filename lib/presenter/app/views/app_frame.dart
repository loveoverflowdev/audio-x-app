import 'package:audio_x_app/presenter/app/blocs/app_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../personal/personal.dart';
import '../blocs/app_state.dart';
import '../../search/search.dart';
import '../../home/home.dart';
import '../blocs/app_bloc.dart';

class AppFrame extends StatelessWidget {
  const AppFrame({super.key});

  final _appTabList = AppTab.values;

  List<Widget> get _pages => _appTabList.map((tab) {
        switch (tab) {
          case AppTab.home:
            return const HomePage();
          case AppTab.search:
            return const SearchPage();
          case AppTab.personal:
            return const PersonalPage();
        }
      }).toList();

  void _changeAppTab(
    final BuildContext context, {
    required int indexTab,
  }) {
    context.read<AppBloc>().add(ChangeTabAppEvent(AppTab.values[indexTab]));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Stack(
            children: [
              AppBar(
                toolbarHeight: 40,
                title: Text(
                  'Audio X',
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 60),
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: Colors.white,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) {
                      final selectedTab = state.tab;
                      return IndexedStack(
                        index: selectedTab.index,
                        children: _pages,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            final selectedTab = state.tab;
            return BottomNavigationBar(
              currentIndex: selectedTab.index,
              onTap: (indexTab) => _changeAppTab(context, indexTab: indexTab),
              items: _appTabList
                  .map(
                    (tab) => BottomNavigationBarItem(
                      icon: Icon(tab.icon),
                      label: tab.label,
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
