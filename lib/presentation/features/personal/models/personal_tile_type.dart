import 'package:flutter/material.dart';

enum PersonalTileType {
  history,
  about,
  favorites,
}

extension PersonalTileTypeExt on PersonalTileType {
  String get title {
    switch (this) {
      case PersonalTileType.history:
        return 'Truyện đã nghe';
      case PersonalTileType.about:
        return 'Về app';
      case PersonalTileType.favorites:
        return 'Truyện yêu thích';
    }
  }

  IconData get icon {
    switch (this) {
      case PersonalTileType.history:
        return Icons.history_outlined;
      case PersonalTileType.about:
        return Icons.info_outline;
      case PersonalTileType.favorites:
        return Icons.favorite_outline;
    }
  }
}
