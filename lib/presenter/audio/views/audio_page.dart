import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'custom/audio_tile.dart';

class AudioPage extends StatelessWidget {
  const AudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Audio Player'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return const AudioTile();
            },
          ),
        ),
      ),
    );
  }
}
