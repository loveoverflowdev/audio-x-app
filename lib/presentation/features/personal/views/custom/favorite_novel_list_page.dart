import 'package:audio_x_app/data/respositories/favorite_novel_repository.dart';
import 'package:audio_x_app/domain/entities/novel.dart';
import 'package:audio_x_app/presentation/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'cell/personal_novel_cell.dart';

class FavorieNovelListPage extends StatefulWidget {
  const FavorieNovelListPage({super.key});

  @override
  State<FavorieNovelListPage> createState() => _FavorieNovelListPageState();
}

class _FavorieNovelListPageState extends State<FavorieNovelListPage> {
  late final FavoriteNovelRepository _favoriteNovelRepository;
  late Future<List<Novel>> _futureNovelList;

  @override
  void initState() {
    super.initState();
    _favoriteNovelRepository = GetIt.instance.get<FavoriteNovelRepository>();
    _futureNovelList = _favoriteNovelRepository.getFavoriteNovelList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Truyện yêu thích'),
      ),
      body: FutureBuilder<List<Novel>>(
        future: _futureNovelList,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const LoadingWidget();
          }
          final novelList = snapshot.data ?? [];
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 0,
              childAspectRatio: 1 / 2,
            ),
            itemCount: novelList.length,
            itemBuilder: (BuildContext context, int index) {
              final novel = novelList[index];
              return PersonalNovelCell(
                novel: novel,
                onPopAfterPush: () {
                  setState(() {
                    _futureNovelList =
                        _favoriteNovelRepository.getFavoriteNovelList();
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
}
