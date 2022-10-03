import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AudioTile extends StatelessWidget {
  const AudioTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl:
                  'https://cn-e-pic.itoon.org/cartoon-posters/1183984b56b.jpg-posterend4',
            ),
          ),
          Column(
            children: const [
              Text('Novel name'),
              Text('Novel Description, Brief, etc, ...')
            ],
          )
        ],
      ),
    );
  }
}
