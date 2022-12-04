import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../personal/personal.dart';
import '../cubits/app_state.dart';
import '../../search/search.dart';
import '../../home/home.dart';
import '../cubits/app_cubit.dart';

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
    context.read<AppCubit>().setAppTab(AppTab.values[indexTab]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        appBar: AppBar(
          toolbarHeight: 40,
          title: Text(
            'Audio X',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              color: Theme.of(context).backgroundColor,
            ),
            child: Align(
              alignment: Alignment.center,
              child: BlocBuilder<AppCubit, AppState>(
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
        ),
        bottomNavigationBar: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final selectedTab = state.tab;
            return BottomNavigationBar(
              currentIndex: selectedTab.index,
              unselectedIconTheme: Theme.of(context).iconTheme,
              unselectedItemColor: Theme.of(context).colorScheme.outline,
              onTap: (indexTab) => _changeAppTab(context, indexTab: indexTab),
              items: _appTabList
                  .map(
                    (tab) => BottomNavigationBarItem(
                      icon: Icon(
                        tab.icon,
                        color: Theme.of(context).primaryColor,
                      ),
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
