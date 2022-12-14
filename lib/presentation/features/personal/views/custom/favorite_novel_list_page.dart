import 'package:audio_x_app/data/respositories/favorite_novel_repository.dart';
import 'package:audio_x_app/domain/entities/novel.dart';
import 'package:audio_x_app/presentation/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';

import 'cell/personal_novel_cell.dart';

int id = 0;

class FavorieNovelListPage extends StatefulWidget {
  const FavorieNovelListPage({super.key});

  @override
  State<FavorieNovelListPage> createState() => _FavorieNovelListPageState();
}

class _FavorieNovelListPageState extends State<FavorieNovelListPage> {
  late final FavoriteNovelRepository _favoriteNovelRepository;
  late Future<List<Novel>> _futureNovelList;
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    _favoriteNovelRepository = GetIt.instance.get<FavoriteNovelRepository>();
    _futureNovelList = _favoriteNovelRepository.getFavoriteNovelList();
    FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      icon: '@mipmap/ic_launcher',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    _flutterLocalNotificationsPlugin.show(
      id++,
      'Chào mừng bạn',
      'Cùng xem danh sách truyện yêu thích',
      const NotificationDetails(
        android: androidNotificationDetails,
      ),
    );
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
