import 'package:flutter/material.dart';

enum AppTab {
  search,
  home,
  personal,
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
  String get title {
    switch (this) {
      case AppTab.home:
        return 'Trang chủ';
      case AppTab.search:
        return 'Tìm kiếm';
      case AppTab.personal:
        return 'Cá nhân';
    }
  }
}
