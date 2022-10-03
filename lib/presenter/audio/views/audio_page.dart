import 'package:flutter/material.dart';

import 'custom/audio_tile.dart';

class AudioPage extends StatelessWidget {
  const AudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const AudioTile();
      },
    );
  }
}
