import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import 'custom/just_audio/common.dart';

class AudioListenerPage extends StatefulWidget {
  const AudioListenerPage({super.key});

  @override
  State<AudioListenerPage> createState() => _AudioListenerPageState();
}

class _AudioListenerPageState extends State<AudioListenerPage> {
  final _player = AudioPlayer();
  final _audioSource = LockCachingAudioSource(Uri.parse(
    // Supports range requests:
    "https://ia903006.us.archive.org/15/items/DauPhaThuongKhungTH/01_Ch%C6%B0%C6%A1ng%200001-0050%20Dau%20Pha%20Thuong%20Khung.mp3",
    // Doesn't support range requests:
    //"https://filesamples.com/samples/audio/mp3/sample4.mp3",
  ));

  @override
  void initState() {
    super.initState();
    // ambiguate(WidgetsBinding.instance)!.addObserver(this);
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    try {
      // Use resolve() if you want to obtain a UriAudioSource pointing directly
      // to the cache file.
      // await _player.setAudioSource(await _audioSource.resolve());
      await _player.setAudioSource(_audioSource);
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    // ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, double, Duration?, PositionData>(
          _player.positionStream,
          _audioSource.downloadProgressStream,
          _player.durationStream,
          (position, downloadProgress, reportedDuration) {
        final duration = reportedDuration ?? Duration.zero;
        final bufferedPosition = duration * downloadProgress;
        return PositionData(position, bufferedPosition, duration);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Audio Player'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display play/pause button and volume/speed sliders.
          ControlButtons(_player),
          // Display seek bar. Using StreamBuilder, this widget rebuilds
          // each time the position, buffered position or duration changes.
          StreamBuilder<PositionData>(
            stream: _positionDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return SeekBar(
                duration: positionData?.duration ?? Duration.zero,
                position: positionData?.position ?? Duration.zero,
                bufferedPosition:
                    positionData?.bufferedPosition ?? Duration.zero,
                onChangeEnd: _player.seek,
              );
            },
          ),
          ElevatedButton(
            onPressed: _audioSource.clearCache,
            child: Text(
              'Clear cache',
              style: Theme.of(context)
                  .primaryTextTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opens volume slider dialog
          IconButton(
            icon: const Icon(
              Icons.volume_up,
              color: Colors.white,
            ),
            onPressed: () {
              showSliderDialog(
                context: context,
                title: "Adjust volume",
                divisions: 10,
                min: 0.0,
                max: 1.0,
                value: player.volume,
                stream: player.volumeStream,
                onChanged: player.setVolume,
              );
            },
          ),

          /// This StreamBuilder rebuilds whenever the player state changes, which
          /// includes the playing/paused state and also the
          /// loading/buffering/ready state. Depending on the state we show the
          /// appropriate button or loading indicator.
          StreamBuilder<PlayerState>(
            stream: player.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;
              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 64.0,
                  height: 64.0,
                  child: const CircularProgressIndicator(),
                );
              } else if (playing != true) {
                return IconButton(
                  icon: const Icon(Icons.play_arrow),
                  iconSize: 64.0,
                  onPressed: player.play,
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  icon: const Icon(Icons.pause),
                  iconSize: 64.0,
                  onPressed: player.pause,
                );
              } else {
                return IconButton(
                  icon: const Icon(Icons.replay),
                  iconSize: 64.0,
                  onPressed: () => player.seek(Duration.zero),
                );
              }
            },
          ),
          // Opens speed slider dialog
          StreamBuilder<double>(
            stream: player.speedStream,
            builder: (context, snapshot) => IconButton(
              icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () {
                showSliderDialog(
                  context: context,
                  title: "Adjust speed",
                  divisions: 10,
                  min: 0.5,
                  max: 1.5,
                  value: player.speed,
                  stream: player.speedStream,
                  onChanged: player.setSpeed,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
