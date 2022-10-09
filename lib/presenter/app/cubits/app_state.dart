import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum AppTab {
  search,
  home,
  personal,
}

class AppState extends Equatable {
  final AppTab tab;

  const AppState({this.tab = AppTab.home});

  AppState copyWith({
    AppTab? tab,
  }) {
    return AppState(tab: tab ?? this.tab);
  }

  @override
  List<Object?> get props => [tab];
}

extension AppTabIcon on AppTab {
  IconData get icon {
    switch (this) {
      case AppTab.home:
        return Icons.dashboard;
      case AppTab.search:
        return Icons.search;
      case AppTab.personal:
        return Icons.person;
    }
  }
}

extension AppTabLabel on AppTab {
  String get label {
    switch (this) {
      case AppTab.home:
        return 'Home';
      case AppTab.search:
        return 'Search';
      case AppTab.personal:
        return 'Personal';
    }
  }
}
