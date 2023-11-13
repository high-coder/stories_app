import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stories_app/provider/audio_provider.dart';

class AudioPlayer extends StatelessWidget {
  final bool scorePage;
  static const double controlSize = 50;
  final Color bgColor;
  const AudioPlayer({super.key, this.scorePage = false, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    AudioProvider audioPlayer = Provider.of<AudioProvider>(context);

    return audioPlayer.audioPlayer == null
        ? const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 23,
            ),
            child: Center(child: LinearProgressIndicator()),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: LayoutBuilder(
              builder: (_, cts) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: double.infinity,
                        child: buildSlider(audioPlayer, cts.maxWidth)),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatDuration(audioPlayer.audioPlayer.position),
                            style: const TextStyle(
                              fontSize: 13.5,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            formatDuration(audioPlayer.audioPlayer.duration ??
                                Duration.zero),
                            style: const TextStyle(
                              fontSize: 13.5,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildControl(audioPlayer),
                  ],
                );
              },
            ),
          );
  }

  Widget buildControl(AudioProvider sp) {
    // final theme = Theme.of(context);

    Icon icon = const Icon(
      Icons.play_arrow,
      color: Colors.black,
      size: 30,
    );
    // Color color = theme.primaryColor.withOpacity(0.1);

    if (sp.audioPlayer.playerState.playing && !scorePage) {
      icon = const Icon(
        Icons.pause,
        // color: theme.primaryColor,
        color: Colors.black,
        size: 30,
      );
      // color = Colors.red.withOpacity(0.1);
    }
    return CustomButton(
      animate: true,
      isThreeD: true,
      borderRadius: 100,
      height: 50,
      width: 50,
      shadowColor: bgColor,
      backgroundColor: Colors.white,
      onPressed: () {
        if (sp.audioPlayer.playerState.playing) {
          sp.pause();
        } else {
          sp.play();
        }
      },
      child: icon,
    );
  }

  Widget buildSlider(AudioProvider anal, double widgetWidth) {
    final position = anal.audioPlayer.position;
    final duration = anal.audioPlayer.duration;
    bool canSetValue = false;
    if (duration != null) {
      canSetValue = position.inMilliseconds > 0;
      canSetValue &= position.inMilliseconds < duration.inMilliseconds;
    }

    double width = widgetWidth - controlSize - 60;

    return SizedBox(
      width: width,
      child: Slider(
        activeColor: Colors.white,
        inactiveColor: Colors.black26,
        onChanged: (v) {
          if (duration != null) {
            final position = v * duration.inMilliseconds;
            anal.audioPlayer.seek(Duration(milliseconds: position.round() - 1));
          }
        },
        value: canSetValue && duration != null
            ? position.inMilliseconds / duration.inMilliseconds
            : 0.0,
      ),
    );
  }

  String formatDuration(Duration dur) {
    int min = dur.inMinutes;
    int sec = dur.inSeconds - min * 60;
    return "$min:${sec ~/ 10}${sec % 10}";
  }
}
