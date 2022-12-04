import 'package:audio_x_app/presentation/audio/views/audio_listener_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AudioListTile extends StatelessWidget {
  const AudioListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return const AudioListenerPage();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: SizedBox(
          height: 80,
          child: Row(
            children: [
              Center(
                child: CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl:
                      'https://i.pinimg.com/236x/1d/21/20/1d2120e48360c4beab759591e4a789c8--one-piece-manga-one-piece-chibi.jpg',
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
      ),
    );
  }
}
