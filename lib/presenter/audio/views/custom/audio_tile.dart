import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AudioTile extends StatelessWidget {
  const AudioTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: SizedBox(
        height: 80,
        child: Row(
          children: [
            Center(
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl:
                    'https://cn-e-pic.itoon.org/cartoon-posters/22021025272.jpg-posterend4',
                errorWidget: (context, url, error) {
                  return const Center(
                    child: Icon(Icons.error_outline),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text('Novel name'),
                  Expanded(child: Text('Novel Description, Brief, etc, ...'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
