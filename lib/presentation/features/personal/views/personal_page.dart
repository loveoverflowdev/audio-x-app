import 'package:audio_x_app/presentation/features/personal/views/custom/favorite_novel_list_page.dart';
import 'package:audio_x_app/presentation/features/personal/views/custom/novel_history_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/personal_tile_type.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  final _tiles = const [
    PersonalTileType.favorites,
    PersonalTileType.history,
    PersonalTileType.about,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cá nhân'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: _tiles.length,
          itemBuilder: (BuildContext context, int index) {
            final tile = _tiles[index];
            return ListTile(
              onTap: () async {
                switch (tile) {
                  case PersonalTileType.history:
                    Navigator.push(context, CupertinoPageRoute(builder: (_) {
                      return const NovelHistoryPage();
                    }));
                    break;
                  case PersonalTileType.about:
                    showAboutDialog(
                      context: context,
                      applicationName: "Audio X",
                      applicationIcon: Icon(
                        Icons.book,
                        size: 40,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    );
                    break;
                  case PersonalTileType.favorites:
                    Navigator.push(context, CupertinoPageRoute(builder: (_) {
                      return const FavorieNovelListPage();
                    }));
                    break;
                }
              },
              leading: Icon(
                tile.icon,
              ),
              title: Text(
                tile.title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
