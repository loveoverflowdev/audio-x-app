import 'package:audio_x_app/presentation/features/personal/views/custom/favorite_novel_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/personal_tile_type.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  final _tiles = PersonalTileType.values;

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
                    // TODO: Handle this case.
                    break;
                  case PersonalTileType.about:
                    // TODO: Handle this case.
                    break;
                  case PersonalTileType.favorites:
                    await Navigator.push(context,
                        CupertinoPageRoute(builder: (_) {
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
