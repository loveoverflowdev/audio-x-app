import 'package:audio_x_app/data/respositories/novel_history_repository.dart';
import 'package:audio_x_app/domain/entities/novel.dart';
import 'package:audio_x_app/presentation/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'cell/personal_novel_cell.dart';

class NovelHistoryPage extends StatefulWidget {
  const NovelHistoryPage({super.key});

  @override
  State<NovelHistoryPage> createState() => _NovelHistoryPageState();
}

class _NovelHistoryPageState extends State<NovelHistoryPage> {
  late final NovelHistoryRepository _novelHistoryRepository;
  late Future<List<Novel>> _futureNovelList;

  @override
  void initState() {
    super.initState();
    _novelHistoryRepository = GetIt.instance.get<NovelHistoryRepository>();
    _futureNovelList = _novelHistoryRepository.getRecentNovelList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Truyện đã nghe'),
      ),
      body: FutureBuilder<List<Novel>>(
        future: _futureNovelList,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const LoadingWidget();
          }
          final novelList = snapshot.data ?? [];
          if (novelList.isEmpty) {
            return _buildEmptyListView();
          }
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 0,
              childAspectRatio: 1 / 2.2,
            ),
            itemCount: novelList.length,
            itemBuilder: (BuildContext context, int index) {
              final novel = novelList[index];
              return PersonalNovelCell(
                novel: novel,
                showDateTime: true,
                onPopAfterPush: () {
                  setState(() {
                    _futureNovelList =
                        _novelHistoryRepository.getRecentNovelList();
                  });
                },
              );
            },
          );
        },
      ),
    );
  }

  _buildEmptyListView() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            'assets/images/empty.png',
            height: 300.0,
            width: 300.0,
          ),
          Text(
            'Trống',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
