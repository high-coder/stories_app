import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioProvider extends ChangeNotifier {
  late AudioPlayer audioPlayer;
  late StreamSubscription<PlayerState> playerStateChangedSubscription;
  late StreamSubscription<Duration?> durationChangedSubscription;
  late StreamSubscription<Duration> positionChangedSubscription;

  Future<void> initPlayer() async {
    audioPlayer = AudioPlayer();
    playerStateChangedSubscription = audioPlayer.playerStateStream.listen(
      (state) async {
        if (state.processingState == ProcessingState.completed) {
          await stop();
        }
        notifyListeners();
      },
    );
    positionChangedSubscription = audioPlayer.positionStream.listen(
      (position) {
        notifyListeners();
      },
    );
    durationChangedSubscription = audioPlayer.durationStream.listen(
      (duration) => notifyListeners(),
    );

    try {
      // await audioPlayer.setUrl(selectedTrans!.audio!, preload: true);
      // await audioPlayer.setFilePath(
      //   selectedTrans.audio!,
      //   preload: true,
      // );
      audioPlayer.setAsset("assets/audio/1.wav", preload: true);
    } catch (e) {
      // print(e);
    }

    // notifyListeners();
  }

  Future<void> stop() async {
    await audioPlayer.stop();
    await audioPlayer.seek(Duration.zero);
    notifyListeners();
  }

  Future<void> pause() async {
    await audioPlayer.pause();
    notifyListeners();
  }

  int? selectedIndex;

  Future<void> play() async {
    await audioPlayer.play();
    notifyListeners();
  }
}
